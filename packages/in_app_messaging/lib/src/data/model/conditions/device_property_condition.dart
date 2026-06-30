import 'package:in_app_messaging/src/core/typedefs.dart';
import 'package:in_app_messaging/src/data/model/comparison/comparison_type.dart';

import '../../../domain/entity/message_condition.dart';

/// Targets a device property exposed as `device.<key>` in condition data.
class DevicePropertyCondition extends MessageCondition {
  /// Property name under the `device` object.
  final String key;

  /// Expected value encoded into the generated JsonLogic.
  final String value;

  /// Operation used to compare the runtime property with [value].
  final ComparisonType type;

  /// Creates a device-property targeting rule.
  DevicePropertyCondition({
    required this.key,
    required this.type,
    required this.value,
  });

  /// Emits JsonLogic against the `device` branch of the condition context.
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
      {"var": 'device.$key'},
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
