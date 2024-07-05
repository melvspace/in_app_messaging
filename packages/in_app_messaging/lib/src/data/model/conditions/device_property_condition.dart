import 'package:in_app_messaging/src/data/model/comparison/comparison_type.dart';

import '../../../domain/entity/message_condition.dart';
import '../../../domain/entity/message_context.dart';

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
  bool evaluate(MessageContext context) {
    return type.compare(context.device.getByKey(key), value);
  }
}
