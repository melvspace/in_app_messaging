import 'package:in_app_messaging/src/domain/entity/message_condition.dart';

class OncePerEventPropertiesCondition extends MessageCondition {
  final Set<String> properties;

  OncePerEventPropertiesCondition({required this.properties});

  @override
  dynamic asJsonLogic() {
    return {
      "!": {
        "in": [
          properties.map((e) => {"var": "event.$e"}).toList(),
          {
            "map": [
              {"var": "interactions.seen_entries"},
              properties.map((e) => {"var": "trigger_properties.$e"}).toList(),
            ]
          },
        ]
      }
    };
  }
}
