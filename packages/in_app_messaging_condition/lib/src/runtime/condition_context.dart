import 'package:in_app_messaging_condition/src/runtime/condition_extension.dart';
import 'package:in_app_messaging_condition/src/runtime/condition_function.dart';
import 'package:in_app_messaging_condition/src/runtime/condition_object.dart';
import 'package:in_app_messaging_condition/src/runtime/standard/date_time_extension.dart';

/// Values and functions available while evaluating a condition expression.
class ConditionContext {
  /// Creates an evaluation context from values and optional runtime extensions.
  const ConditionContext({
    this.values = const {},
    this.functions = const {},
    this.extensions = const [],
  });

  /// Values available through identifier and bracket access.
  final Map<String, Object?> values;

  /// Application-defined functions keyed by their expression name.
  ///
  /// These functions take precedence over built-ins with the same name.
  final Map<String, ConditionFunction> functions;

  /// Adapters that expose application values as [ConditionObject]s.
  final List<ConditionExtension> extensions;

  static final _builtInFunctions = <String, ConditionFunction>{
    'length': _length,
  };

  static const _kDefaultExtensions = <ConditionExtension>[
    DateTimeConditionExtension(),
  ];

  /// Resolves an application-defined or built-in function named [name].
  ///
  /// Returns `null` when no function has been registered with that name.
  ConditionFunction? resolveFunction(String name) {
    return functions[name] ?? _builtInFunctions[name];
  }

  /// Adapts [value] to its condition-expression behavior when supported.
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

Object? _length(List<Object?> arguments) {
  if (arguments.length != 1) return null;

  return switch (arguments.single) {
    final String value => value.length,
    final List<Object?> value => value.length,
    final Set<Object?> value => value.length,
    final Map<Object?, Object?> value => value.length,
    _ => null,
  };
}
