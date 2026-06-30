import 'package:in_app_messaging/in_app_messaging.dart';

const testMessageType = MessageType(name: 'test');

Map<String, dynamic> testContext({
  Map<String, dynamic> device = const {},
  Map<String, dynamic> user = const {},
}) {
  return {
    'device': {
      'platform': 'android',
      'version': '1.0.0',
      'version_number': '1',
      'language': 'en',
      ...device,
    },
    'user': {
      'id': 'user-1',
      ...user,
    },
  };
}

SimpleMessage testMessage({
  required String id,
  bool enabled = true,
  MessageType type = testMessageType,
  DateTime? start,
  DateTime? end,
  int priority = 0,
  List<MessageTrigger> triggers = const [
    MessageTrigger.event(event: 'event'),
  ],
  dynamic condition,
  Map<String, dynamic> data = const {},
}) {
  final now = DateTime.now();
  return SimpleMessage(
    id: id,
    enabled: enabled,
    type: type,
    start: start ?? now.subtract(const Duration(minutes: 1)),
    end: end,
    priority: priority,
    triggers: triggers,
    condition: condition,
    data: data,
  );
}
