import 'package:bloc/bloc.dart';
import 'package:expense_tracker/app/models/expense/expense_model.dart';
import 'package:expense_tracker/hive/repository/base_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this.repository) : super(const DashboardState.loading());
  final BaseHiveRepository<ExpenseModel> repository;

  Future<void> loadDashboard() async {
    final totalExpenses = await repository.totalExpenses();
    final allExpensesDetails = await repository.getAll();
    final categoryAmounts = _calculateTotalAmountByCategory(allExpensesDetails);

    emit(
      DashboardState.loaded(
          expenses: totalExpenses,
          transactions: allExpensesDetails,
          categoryTotals: categoryAmounts,),
    );
  }

  List<Map<String, dynamic>> _calculateTotalAmountByCategory(
      List<ExpenseModel> transactions,) {
    final categoryTotals = <String, double>{};

    for (final transaction in transactions) {
      final category = transaction.category;
      final amount = transaction.amount;

      if (categoryTotals.containsKey(category)) {
        categoryTotals[category] = categoryTotals[category]! + amount;
      } else {
        categoryTotals[category] = amount;
      }
    }

    final result = <Map<String, dynamic>>[];
    categoryTotals.forEach((category, totalAmount) {
      result.add({
        'name': category,
        'amount': totalAmount,
      });
    });

    return result;
  }
}
