import 'package:in_app_messaging/src/core/typedefs.dart';
import 'package:in_app_messaging/src/data/model/comparison/comparison_type.dart';

import '../../../domain/entity/message_condition.dart';

/// Targets a user property exposed as `user.<key>` in condition data.
class UserPropertyCondition extends MessageCondition {
  /// Property name under the `user` object.
  final String key;

  /// Expected value encoded into the generated JsonLogic.
  final String value;

  /// Operation used to compare the runtime property with [value].
  final ComparisonType type;

  /// Creates a user-property targeting rule.
  UserPropertyCondition({
    required this.key,
    required this.type,
    required this.value,
  });

  /// Emits JsonLogic against the `user` branch of the condition context.
  @override
  JsonMap asJsonLogic() {
    final negate = switch (type) {
      ComparisonType.doesNotContains => true,
      _ => false,
    };

    final op = switch (type) {
      ComparisonType.exactlyMatches => '==',
      ComparisonType.contains => 'in',
      ComparisonType.doesNotContains => 'in',
      ComparisonType.containsRegex => 'in',
      ComparisonType.greater => '>',
      ComparisonType.greaterOrEquals => '>=',
      ComparisonType.less => '<',
      ComparisonType.lessOrEquals => '<=',
      ComparisonType.equals => '==',
      ComparisonType.notEquals => '!=',
    };

    final rule = [
      {"var": 'user.$key'},
      value
    ];

    return {
      if (negate) //
        '!': {op: rule}
      else
        op: rule,
    };
  }
}
