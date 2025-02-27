import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get abbreviatedDay => DateFormat(DateFormat.ABBR_WEEKDAY).format(this);

  String get monthName => DateFormat(DateFormat.MONTH).format(this);

  String get dayString => DateFormat(DateFormat.DAY).format(this);

  String get fullDateTime => DateFormat.yMMMEd().add_jms().format(this);

  DateTime get onlyDate => DateTime(year, month, day);

  DateTime withTime([int hour = 0, int minute = 0]) => DateTime(
        this.year,
        this.month,
        this.day,
        hour,
        minute,
      );

  /// this ∈ [from; to)
  bool isBetween(DateTime from, DateTime to) =>
      (isAtSameMomentAs(from) || isAfter(from)) && isBefore(to);


}
