import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_state.freezed.dart';

@freezed
class ExpenseState with _$ExpenseState {
  const factory ExpenseState({
    @Default(ExpenseFormStateStep.initial) ExpenseFormStateStep step,
    @Default(0.0) double amount,
    @Default('') String? category,
    @Default('ksh') String? currency,
    @Default('') String? description,
    @Default('') String? paymentMethod,
    String? error,
  }) = _ExpenseState;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

enum ExpenseFormStateStep { initial, progress, success, failure }
