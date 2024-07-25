import 'package:in_app_messaging/src/core/typedefs.dart';
import 'package:in_app_messaging/src/data/model/comparison/comparison_type.dart';

import '../../../domain/entity/message_condition.dart';

class DevicePropertyCondition extends MessageCondition {
  final String key;
  final String value;
  final ComparisonType type;

  DevicePropertyCondition({
    required this.key,
    required this.type,
    required this.value,
  });

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
