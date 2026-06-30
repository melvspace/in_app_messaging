import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/src/domain/entity/triggers/event_sequence_item.dart';

part 'message_trigger.freezed.dart';
part 'message_trigger.g.dart';

/// A rule that can turn runtime activity into a message candidate.
@Freezed(unionKey: 'type')
sealed class MessageTrigger with _$MessageTrigger {
  const MessageTrigger._();

  /// Selects a message from a cron schedule.
  @experimental
  const factory MessageTrigger.cron({
    /// Cron expression for the schedule.
    required String cron,

    /// Event emitted when the schedule fires instead of showing directly.
    ///
    /// Use this when a scheduled activation should feed an event sequence.
    /// When null, the cron trigger selects the message directly.
    String? event,
  }) = MessageCronTrigger;

  /// Selects a message from an application event.
  const factory MessageTrigger.event({
    /// Event name to match.
    required String event,

    /// Payload subset that must match the runtime event payload.
    ///
    /// Runtime events may include additional keys. Only keys present here are
    /// compared by [contains].
    @Default({}) Map<String, dynamic>? data,
  }) = MessageEventTrigger;

  /// Selects a message after a configured event sequence has been observed.
  ///
  /// Event-sequence matching is experimental and may change.
  @experimental
  const factory MessageTrigger.eventSequence({
    /// Ordered events that must be observed.
    required List<EventSequenceItem> events,

    /// Optional payload constraints associated with [events].
    required List<Map<String, dynamic>?> data,
  }) = MessageEventSequenceTrigger;

  /// Whether this runtime trigger satisfies a configured [trigger].
  ///
  /// For event triggers, [data] is treated as a required subset: a runtime
  /// event may have extra payload keys and still match.
  bool contains(MessageTrigger trigger) {
    if ((this, trigger)
        case (MessageEventTrigger it, MessageEventTrigger trigger)) {
      final keys = trigger.data?.keys.toSet() ?? {};
      it = it.copyWith(
        data: {...it.data ?? {}}
          ..removeWhere((key, value) => !keys.contains(key)),
      );

      return it == trigger;
    }

    return this == trigger;
  }

  /// Parses a trigger from JSON.
  factory MessageTrigger.fromJson(Map<String, dynamic> json) =>
      _$MessageTriggerFromJson(json);
}
