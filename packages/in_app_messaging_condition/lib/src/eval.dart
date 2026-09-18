import 'package:in_app_messaging_condition/src/compile/parser.dart';
import 'package:in_app_messaging_condition/src/runtime/condition_context.dart';

/// Evaluates [condition] against [context] and returns its truthiness.
///
/// Throws a [FormatException] when the condition is malformed, contains an
/// invalid regular expression, or calls an unknown function.
bool eval(String condition, [ConditionContext context = const .new()]) {
  return toConditionResult(parse(condition)(context));
}
