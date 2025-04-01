import 'package:bloc/bloc.dart';
import 'package:expense_tracker/app/domain/expense/cubit/expense_state.dart';
import 'package:expense_tracker/app/models/expense/expense_model.dart';
import 'package:expense_tracker/hive/repository/base_repository.dart';
import 'package:expense_tracker/hive/repository/expense_repository.dart';
import 'package:expense_tracker/util/app_utils.dart';
import 'package:injectable/injectable.dart';

// part 'expense_state.dart';

@injectable
class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit(this.repository) : super(const ExpenseState());
  final BaseHiveRepository<ExpenseModel> repository;

  Future<double> getTotal() async {
    return repository.totalExpenses();
  }

  void onAmountChanged(String value) {
    emit(state.copyWith(amount: double.parse(value)));
  }

  void categoryChanged(String value) {
    emit(state.copyWith(category: value));
  }

  void descriptionChanged(String value) {
    emit(state.copyWith(description: value));
  }

  void paymentMethodChanged(String value) {
    emit(state.copyWith(paymentMethod: value));
  }

  Future<void> addExpense() async {
    emit(state.copyWith(step: ExpenseFormStateStep.progress));
    try {
      final model = ExpenseModel.create(
          amount: state.amount,
          currency: state.currency!,
          category: state.category!,
          paymentMethod: state.paymentMethod!,
          description: state.description!);

      await repository.add(model);

      emit(state.copyWith(step: ExpenseFormStateStep.success));
    } catch (e) {
      logThis(e);
      emit(state.copyWith(
          step: ExpenseFormStateStep.failure, error: e.toString()));
    }
  }

  Future<void> deleteAll() async {
    await repository.deleteAll();
  }
}
