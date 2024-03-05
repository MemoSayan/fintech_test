# Fintech Test

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Generated by the [Very Good CLI][very_good_cli_link] 🤖

A Very Good Project created by Very Good CLI.

---

## Getting Started 🚀
Prerequisites
Make sure to list any prerequisites needed to run your application. For example:

- Flutter SDK (version 3.19.2)
- FVM - Flutter Version Management(opcional)

If the correct sdk or FMV version are installed you can simply use: 

``` sh  
# Install FVM (Flutter Version Management)
$ fvm install 3.19.2

# Use the specified Flutter version
$ fvm use 3.19.2

# Install project dependencies
$ fvm flutter pub get

# run buil runner
 $ fvm dart run build_runner build --delete-conflicting-outputs


To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

 Actually only works fine on mock flavor 

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart --dart-define=FINTECH_ENVIRONMENT=mock --dart-define=FINTECH_USE_MOCKS=true

```

_\*Fintech Test works on iOS, Android, Web, and Windows._

## Possible Issues 🛠️

If you encounter any issues while setting up or running the application, here are some common problems and their solutions:

### 1. AppLocalizations.

_\*because l10n.yaml exists the options defined there will be used instead._

#### Solution:

1. **Step 1:**.
  # Regenerate localization files and clean the project
   ```sh
$ flutter gen-l10n
$ flutter clean
```
  # Additionally, in your pubspec.yaml file, modify the generate line from true to false as follows:
       ``` generate: false ```

   After making this change, execute the following commands:
  # Get project dependencies
    $ flutter pub get

    # Restore the 'generate' setting to true
    $ flutter gen-l10n
    $ flutter pub get

These steps are intended to resolve the specific issue you are facing. Make sure to follow each step carefully to ensure a successful resolution.
 
   


---


## Project Description

### Project Structure

The project follows the Clean Architecture pattern, promoting separation of concerns and maintainability. Below is an overview of the key directories and files:

```
.
├── lib
│   ├── features
│   │   ├── data
│   │   │   ├── repositories
│   │   │   │   ├── user_repository_impl.dart
│   │   │   │   └── ...
│   │   │   └── data_sources
│   │   │   |   ├── remote_data_source.dart
│   │   │   |   └── ...
|   |   |   |__ models
|   |   |       ├── user_response.dart
│   │   │       └── ...
|   |   |   
│   │   ├── domain 
│   │   │   ├── entities
│   │   │   │   ├── user.dart
│   │   │   │   └── ...
│   │   │   ├── repositories
│   │   │   │   ├── user_repository.dart
│   │   │   │   └── ...
│   │   │   └── usecases
│   │   │       ├── get_user_info_usecase.dart
│   │   │       └── ...
│   │   └── presentation
|   |       |
|   |       ├── logic
|   |       |   ├── auth_bloc
|   |       |   └── ... 
│   │       └──  views
│   │           ├── pages
|   |           |    ├── login_page.dart
|   |           |    └── ... 
│   │           └──  widgets
|   |               ├── login_body.dart
|   |               └── ...       
│   ├── core
│   │   ├── helpers
│   │   └── ...
│   ├── app
│   │   ├── app.dart
│   │   └── ... 
|   |   
│   └── main_development.dart
├── assets
│   ├── images
│   │   ├── logo.png
│   │   └── ...
│   └── ...
├── pubspec.yaml
└── ...

```
## Clean Architecture 🧽
The project adheres to the principles of Clean Architecture:

Data Layer: Manages data sources and repositories responsible for data retrieval.
Domain Layer: Contains entities, use cases, and interfaces defining business logic.
Presentation Layer: Handles UI components, screens, and state management.

Key Components
User Repository: Manages the data access logic for user-related operations.
Remote Data Source: Handles data retrieval from remote sources (APIs, databases, etc.).
User Entity: Represents the core structure for user-related data.
Get User Info Use Case: Implements the business logic for retrieving user information.

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

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:fintech_test/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

### Generating Translations

To use the latest translations changes, you will need to generate them:

1. Generate localizations for the current project:

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
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
