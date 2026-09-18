# in_app_messaging_condition

A small Dart expression evaluator for deciding when to show in-app messages.

> This package is under development. `eval` does not evaluate expressions yet.

## Planned usage

```dart
import 'package:in_app_messaging_condition/in_app_messaging_condition.dart';

final shouldShow = eval(
  'user.plan == "pro"',
  const ConditionContext(
    values: {
      'user': {'plan': 'pro'},
    },
  ),
);
```

See [GRAMMAR.md](GRAMMAR.md) for the planned expression syntax.
