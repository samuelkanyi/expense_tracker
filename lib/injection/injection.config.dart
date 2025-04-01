// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../app/domain/dashboard/cubit/cubit/dashboard_cubit.dart' as _i759;
import '../app/domain/expense/cubit/expense_cubit.dart' as _i221;
import '../app/domain/income/cubit/income_cubit.dart' as _i305;
import '../app/domain/login/cubit/cubit/login_cubit.dart' as _i635;
import '../app/domain/settings/main/cubit/setting_cubit.dart' as _i725;
import '../app/domain/sign_up/cubit/cubit/sign_up_cubit.dart' as _i330;
import '../app/models/expense/expense_model.dart' as _i453;
import '../app/repository/login/login_repository.dart' as _i494;
import '../app/repository/login/login_repository_impl.dart' as _i1043;
import '../app/repository/sign_up/sign_up_repository.dart' as _i118;
import '../app/repository/sign_up/sign_up_repository_impl.dart' as _i169;
import '../hive/repository/base_repository.dart' as _i758;
import '../hive/repository/expense_repository.dart' as _i701;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final externalDependenciesModule = _$ExternalDependenciesModule();
    gh.factory<_i725.SettingCubit>(() => _i725.SettingCubit());
    gh.factory<_i305.IncomeCubit>(() => _i305.IncomeCubit());
    gh.singleton<_i454.SupabaseClient>(
        () => externalDependenciesModule.supabaseClient);
    gh.factory<_i118.SignUpRepository>(() => _i169.SignUpRepositoryImpl());
    gh.factory<_i758.BaseHiveRepository<_i453.ExpenseModel>>(
        () => _i701.ExpenseRepository());
    gh.factory<_i221.ExpenseCubit>(() =>
        _i221.ExpenseCubit(gh<_i758.BaseHiveRepository<_i453.ExpenseModel>>()));
    gh.factory<_i759.DashboardCubit>(() => _i759.DashboardCubit(
        gh<_i758.BaseHiveRepository<_i453.ExpenseModel>>()));
    gh.factory<_i330.SignUpCubit>(
        () => _i330.SignUpCubit(gh<_i118.SignUpRepository>()));
    gh.factory<_i494.LoginRepository>(
        () => _i1043.LoginRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.factory<_i635.LoginCubit>(
        () => _i635.LoginCubit(gh<_i494.LoginRepository>()));
    return this;
  }
}

class _$ExternalDependenciesModule extends _i464.ExternalDependenciesModule {}
