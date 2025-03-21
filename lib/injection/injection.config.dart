// dart format width=80
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

import '../app/repository/login/login_repository.dart' as _i494;
import '../app/repository/login/login_repository_impl.dart' as _i1043;
import '../app/repository/sign_up/sign_up_repository.dart' as _i118;
import '../app/repository/sign_up/sign_up_repository_impl.dart' as _i169;
import '../login/cubit/cubit/login_cubit.dart' as _i780;
import '../sign_up/cubit/cubit/sign_up_cubit.dart' as _i637;
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
    gh.factory<_i780.LoginCubit>(() => _i780.LoginCubit());
    gh.singleton<_i454.SupabaseClient>(
        () => externalDependenciesModule.supabaseClient);
    gh.factory<_i118.SignUpRepository>(() => _i169.SignUpRepositoryImpl());
    gh.factory<_i637.SignUpCubit>(
        () => _i637.SignUpCubit(gh<_i118.SignUpRepository>()));
    gh.factory<_i494.LoginRepository>(
        () => _i1043.LoginRepositoryImpl(gh<_i454.SupabaseClient>()));
    return this;
  }
}

class _$ExternalDependenciesModule extends _i464.ExternalDependenciesModule {}
