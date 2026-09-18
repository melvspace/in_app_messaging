/// A function callable from a condition expression.
///
/// Arguments are evaluated before invocation. Returning `null` indicates that
/// the function has no value or does not support the supplied arguments.
typedef ConditionFunction = Object? Function(List<Object?> arguments);
