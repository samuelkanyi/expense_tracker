import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Format on num {
  //TODO: current country from settings
  String formatPrice(BuildContext context) => NumberFormat.currency(
        symbol: 'Ksh',
        locale: Localizations.localeOf(context).toLanguageTag(),
        decimalDigits: 0,
      ).format(this);
}
