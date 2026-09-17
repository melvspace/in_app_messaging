import 'package:in_app_messaging_condition/in_app_messaging_condition.dart';

class const ConditionContext({
  final Map<String, Object?> values = const {},
  final List<ConditionExtension> extensions = const [],
}) {
  static const _kDefaultExtensions = <ConditionExtension>[
    DateTimeConditionExtension(),
  ];

  ConditionObject? toConditionObject(Object value) {
    if (value is ConditionObject) return value;

    for (final extension in extensions) {
      if (extension.check(value)) {
        return extension.toConditionObject(value);
      }
    }

    for (final extension in _kDefaultExtensions) {
      if (extension.check(value)) {
        return extension.toConditionObject(value);
      }
    }

    return null;
  }
}
