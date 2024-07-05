import 'package:in_app_messaging/src/data/model/comparison/comparison_type.dart';

import '../../../domain/entity/message_condition.dart';
import '../../../domain/entity/message_context.dart';

class DeviceCondition extends MessageCondition {
  final String key;
  final String value;
  final ComparisonType type;

  DeviceCondition({required this.key, required this.value, required this.type});

  @override
  bool evaluate(MessageContext context) {
    return type.compare(context.device.toJson()[key], value);
  }
}
