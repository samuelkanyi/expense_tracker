//call this to pretty log something
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

void logThis(dynamic message) {
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
    filter: null,
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
    return password.contains(RegExp(r'[A-Z]'));
  } else if (condition == PasswordCondition.number) {
    return password.contains(RegExp(r'[0-9]'));
  } else if (condition == PasswordCondition.smallLetter) {
    return password.contains(RegExp(r'[a-z]'));
  } else {
    return false;
  }
}
