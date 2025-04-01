part of 'income_cubit.dart';

@freezed
class IncomeState with _$IncomeState {
  const factory IncomeState.initial(double total) = _Initial;
  const factory IncomeState.loaded(double total) = _Loaded;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
