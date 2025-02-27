import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  void pop<T extends Object>([T? result]) => Navigator.of(this).pop(result);
  void popUntil(String routeName) =>
      Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  void pushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);
}
