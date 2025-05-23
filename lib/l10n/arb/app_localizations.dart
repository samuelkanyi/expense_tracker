import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_sw.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('sw')
  ];

  /// Text shown in login guide screens
  ///
  /// In en, this message translates to:
  /// **'Gain total control of your money'**
  String get guide_screen_1_title;

  /// Text shown in login guide screens
  ///
  /// In en, this message translates to:
  /// **'Become your own money manager and make every cent count'**
  String get guide_screen_1_desc;

  /// Text shown in login guide screens
  ///
  /// In en, this message translates to:
  /// **'Know where your money goes'**
  String get guide_screen_2_title;

  /// Text shown in login guide screens
  ///
  /// In en, this message translates to:
  /// **'Track your transaction easily, with categories and financial report'**
  String get guide_screen_2_desc;

  /// Text shown in login guide screens
  ///
  /// In en, this message translates to:
  /// **'Planning ahead'**
  String get guide_screen_3_title;

  /// Text shown in login guide screens
  ///
  /// In en, this message translates to:
  /// **'Setup your budget for each category so you in control'**
  String get guide_screen_3_desc;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create your account to get started'**
  String get create_account;

  /// No description provided for @fullname.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullname;

  /// No description provided for @fullname_hint.
  ///
  /// In en, this message translates to:
  /// **'John Doe'**
  String get fullname_hint;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email;

  /// No description provided for @email_hint.
  ///
  /// In en, this message translates to:
  /// **'john@example.com'**
  String get email_hint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @i_agree_terms_1.
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get i_agree_terms_1;

  /// No description provided for @i_agree_terms_2.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get i_agree_terms_2;

  /// No description provided for @i_agree_terms_3.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get i_agree_terms_3;

  /// No description provided for @i_agree_terms_4.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get i_agree_terms_4;

  /// No description provided for @alternate_signup.
  ///
  /// In en, this message translates to:
  /// **'or sign up with'**
  String get alternate_signup;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_account;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'sw'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'sw':
      return AppLocalizationsSw();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
