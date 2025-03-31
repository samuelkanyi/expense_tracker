part of 'expense_cubit.dart';

@freezed
sealed class ExpenseState with _$ExpenseState {
  const ExpenseState._();
  const factory ExpenseState.initial() = _Initial;
  const factory ExpenseState.loading() = _Loading;
  const factory ExpenseState.sucess(ExpenseModel model) = _Success;
  const factory ExpenseState.failed(String model) = _Failed;
}
