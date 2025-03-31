import 'package:bloc/bloc.dart';
import 'package:expense_tracker/app/models/expense/expense_model.dart';
import 'package:expense_tracker/hive/repository/expense_repository.dart';
import 'package:expense_tracker/util/app_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'expense_state.dart';
part 'expense_cubit.freezed.dart';

@injectable
class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit(this.repository) : super(const ExpenseState.initial());
  final ExpenseRepository repository;

  Future<void> addExpense(double amount, String currency, String category,
      String paymentMethod) async {
    emit(const ExpenseState.loading());
    try {
      final model = ExpenseModel.create(
        amount: amount,
        currency: currency,
        category: category,
        paymentMethod: paymentMethod,
      );

      await repository.add(model);

      emit(ExpenseState.sucess(model));
    } catch (e) {
      logThis(e);
      emit(ExpenseState.failed('Failed to add Expense ${e.toString()}'));
    }
  }

  Future<void> getAllExpenses() async {
    emit(const ExpenseState.loading());

    try {
      final List<ExpenseModel> allExpenses = await repository.getAll();
      emit(ExpenseState.sucess(allExpenses.first));
    } catch (e) {
      logThis(e);
      emit(ExpenseState.failed('Falied to fetch all expenses ${e.toString()}'));
    }
  }
}
