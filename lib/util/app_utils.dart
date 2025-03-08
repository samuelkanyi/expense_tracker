//call this to pretty log something
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

void logThis(dynamic message) {
  final logger = Logger(
    printer: PrettyPrinter(
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  //only log in debug mode
  if (kDebugMode) {
    logger.d(message);
  }
}
enum PasswordCondition {
  capitalLetter,
  smallLetter,
  number,
}

bool isConditionSatisfied(String password, PasswordCondition condition) {
  if (condition == PasswordCondition.capitalLetter) {
    return password.contains(RegExp('[A-Z]'));
  } else if (condition == PasswordCondition.number) {
    return password.contains(RegExp('[0-9]'));
  } else if (condition == PasswordCondition.smallLetter) {
    return password.contains(RegExp('[a-z]'));
  } else {
    return false;
  }
}
