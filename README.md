
![coverage][coverage_badge]
[![License: MIT][license_badge]][license_link]

# Expense Tracker

## Overview
Expense Tracker is a Flutter application designed to help users track and manage their personal expenses. The app provides an intuitive interface for recording, categorizing, and visualizing spending habits to promote better financial management.

## Features
- Track daily expenses
- Categorize transactions
- Visualize spending with charts
- User authentication
- Multi-platform support

## Technical Implementation

### State Management
The application uses the BLoC (Business Logic Component) pattern for state management [1]. This is implemented with the `bloc` and `flutter_bloc` packages, providing a clean separation between the UI and business logic. The architecture follows reactive programming principles, making the app responsive and maintainable.

### Backend Implementation
The app uses Supabase as its backend service, implemented via the `supabase_flutter` package [1]. This provides:
- User authentication
- Database storage
- Real-time data synchronization

Additionally, Firebase Core is integrated, potentially for analytics or secondary services [1].

### Local Storage
Hive is used for local data persistence with `hive_ce` and `hive_ce_flutter` [1], allowing the app to:
- Function offline
- Cache data for improved performance
- Store user preferences

### API Services
API services are likely handled through:
- Supabase client for backend communication
- Dependency injection using `get_it` and `injectable` for service management [1]
- Service classes that would be organized using the repository pattern (based on the project structure)

### Navigation
The app implements navigation using `go_router` [1], providing:
- Deep linking capability
- Clean navigation patterns
- Route management

### Localization
This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].
Internationalization and localization are implemented using:
- Flutter's built-in `flutter_localizations` [1]
- The `intl` package for formatting dates, numbers, and plurals [1]
- Generated localization files with the `flutter_intl` configuration enabled [1]

This allows the app to support multiple languages and format data according to the user's locale.

### UI Components
- `fl_chart` for expense visualization and reporting [1]
- `flutter_svg` for vector graphics [1]
- `google_fonts` for typography [1]
- `font_awesome_flutter` for icons [1]

## Getting Started
1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Create a `.env` file with necessary environment variables
4. Run the app with `flutter run`

## Requirements
- Flutter SDK ≥ 3.5.0 [1]
- Dart ≥ 2.19.0 (implied by Flutter version)

## Development
The project uses:
- Code generation tools with `build_runner`, `freezed`, and `json_serializable` [1]
- Strong static analysis with `very_good_analysis` [1]
- Testing framework with `bloc_test` and `mocktail` [1]


This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Expense Tracker works on iOS, Android, Web, and Windows._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

Alternatively, run `flutter run` and code generation will take place automatically.

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
