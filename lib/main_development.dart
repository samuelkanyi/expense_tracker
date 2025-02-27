import 'package:expense_tracker/app/app.dart';
import 'package:expense_tracker/bootstrap.dart';
import 'package:logger/logger.dart';

void main() {
  _setupLogging();
  bootstrap(() => const App());
}

void _setupLogging() {
  Logger.level = Level.all;
  Logger.addLogListener((logEvent){
      print('${logEvent.level.name}: ${logEvent.time}: ${logEvent.message}');
    
  });
}
