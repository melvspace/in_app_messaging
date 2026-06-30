# In-App Messaging JsonLogic

Pure Dart JsonLogic implementation used by `in_app_messaging` to evaluate
serialized conditions.

This package is maintained as part of the in-app messaging workspace because the
original Dart JsonLogic package is not actively maintained. It remains
independent of Flutter and persistence so it can be used in pure Dart contexts.

## Usage

```dart
import 'package:in_app_messaging_json_logic/in_app_messaging_json_logic.dart';

void main() {
  final jsonLogic = Jsonlogic();

  final rule = {
    'and': [
      {
        '<': [
          {'var': 'temp'},
          110,
        ],
      },
      {
        '==': [
          {'var': 'pie.filling'},
          'apple',
        ],
      },
    ],
  };

  final data = {
    'temp': 100,
    'pie': {
      'filling': 'apple',
    },
  };

  final result = jsonLogic.apply(rule, data);
  print(result); // true
}
```

## In-App Messaging Conditions

The core package serializes conditions as JsonLogic so message configuration can
come from local or remote sources. The JsonLogic package evaluates those rules
against an evaluation context containing event properties, user/device
attributes, and interaction history.

## Tests

Run the package tests from the workspace root:

```bash
dart run melos exec --scope=in_app_messaging_json_logic -- dart test
```

The package includes compliance fixtures for the JsonLogic behavior it supports.
