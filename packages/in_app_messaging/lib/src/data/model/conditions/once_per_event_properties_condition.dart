import 'package:in_app_messaging/src/domain/entity/message_condition.dart';

/// Allows a message once for each configured event-property key.
class OncePerEventPropertiesCondition extends MessageCondition {
  /// Event property names that form the uniqueness key.
  final Set<String> properties;

  /// Whether the event name participates in the uniqueness key.
  ///
  /// When true, a message may be shown once per matching property set per event
  /// name. When false, the same property set is considered duplicate across all
  /// event names.
  final bool distinct;

  /// Creates a property-based recurrence rule.
  OncePerEventPropertiesCondition({
    required this.properties,
    this.distinct = true,
  });

  /// Compares current event properties with persisted trigger properties.
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
