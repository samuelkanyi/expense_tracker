import 'package:expense_tracker/l10n/arb/app_localizations.dart'
    show AppLocalizations;
import 'package:expense_tracker/login_guide/view/login_guide_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const LoginGuidePage(),
    );
  }
}
