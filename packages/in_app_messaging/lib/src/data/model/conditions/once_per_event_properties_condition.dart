import 'package:in_app_messaging/src/domain/entity/message_condition.dart';

class OncePerEventPropertiesCondition extends MessageCondition {
  final Set<String> properties;

  /// if [distinct] is true, it will compare properties of event triggered just now with previous events of same event type
  ///
  /// otherwise it will compare properties of event triggered just now with all previous events.
  final bool distinct;

  OncePerEventPropertiesCondition({
    required this.properties,
    this.distinct = true,
  });

  @override
  dynamic asJsonLogic() {
    return {
      "!": {
        "in": [
          [
            ...properties.map((e) => {"var": "event.$e"}),
            if (distinct) {"var": "event.event_name"}
          ],
          {
            "map": [
              {"var": "interactions.seen_entries"},
              [
                ...properties.map((e) => {"var": "trigger_properties.$e"}),
                if (distinct) {"var": "trigger"}
              ],
            ]
          },
        ]
      }
    };
  }
}
