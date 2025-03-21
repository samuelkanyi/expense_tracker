import 'package:expense_tracker/injection/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt getIt = GetIt.instance;

// Register the Supabase client as a dependency
@module
abstract class ExternalDependenciesModule {
  @singleton
  SupabaseClient get supabaseClient => Supabase.instance.client;
}

// DI configuration
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
@injectableInit
void configureInjection(String environment) => getIt.init(
      environment: environment,
    );
