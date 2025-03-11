import 'package:expense_tracker/app/app.dart';
import 'package:expense_tracker/bootstrap.dart';
import 'package:expense_tracker/util/app_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

void main() {
  _setupLogging();
  bootstrap(() => const App());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    if (kDebugMode) {
      logThis('${rec.level.name}: ${rec.time}: ${rec.message}');
    }
  });
}
