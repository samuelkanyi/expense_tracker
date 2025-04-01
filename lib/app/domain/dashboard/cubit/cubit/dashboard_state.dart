part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.loaded(
      {@Default(100000.00) double income,
      @Default(0) double expenses,
      @Default([]) List<Map<String, dynamic>> categoryTotals,
      @Default([]) List<ExpenseModel> transactions}) = Loaded;

  const factory DashboardState.loading() = Loading;
}
