import 'package:expense_tracker/l10n/arb/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter/widgets.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
