/// Callback operators use to evaluate nested rules.
///
/// Operators receive this so nested rules are evaluated with the same data
/// scope as the parent rule.
typedef Applier = dynamic Function(dynamic rule, dynamic data);

/// Function signature for a JsonLogic operator.
///
/// [params] contains raw parameter rules. Operators decide which parameters to
/// evaluate and when, which is what enables lazy behavior for `if`, `and`, and
/// `or`.
typedef Operator = dynamic Function(Applier applier, dynamic data, List params);
