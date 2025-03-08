import 'package:expense_tracker/app/app.dart';
import 'package:expense_tracker/bootstrap.dart';
import 'package:expense_tracker/util/app_utils.dart';
import 'package:logger/logger.dart';

void main() {
  _setupLogging();
  bootstrap(() => const App());
}

void _setupLogging() {
  Logger.level = Level.all;
  Logger.addLogListener((logEvent){
      logThis('${logEvent.level.name}: ${logEvent.time}: ${logEvent.message}');
    
  });
}
