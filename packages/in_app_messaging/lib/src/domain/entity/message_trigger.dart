import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/src/domain/entity/triggers/event_sequence_item.dart';

part 'message_trigger.freezed.dart';
part 'message_trigger.g.dart';

/// A trigger definition that can make a campaign eligible for display.
@Freezed(unionKey: 'type')
sealed class MessageTrigger with _$MessageTrigger {
  const MessageTrigger._();

  /// Makes a message eligible from a scheduled activation.
  @experimental
  const factory MessageTrigger.cron({
    /// Cron expression for the planned activation time.
    required String cron,

    /// Event emitted when the schedule fires instead of showing directly.
    ///
    /// Use this when a scheduled activation should feed an event sequence.
    /// When null, the cron trigger selects the message directly.
    String? event,
  }) = MessageCronTrigger;

  /// Makes a message eligible when a matching application event is triggered.
  const factory MessageTrigger.event({
    /// Event name that must match the runtime trigger.
    required String event,

    /// Payload subset required from the runtime event.
    ///
    /// Runtime events may include additional keys. Only keys present here are
    /// compared by [contains].
    @Default({}) Map<String, dynamic>? data,
  }) = MessageEventTrigger;

  /// Makes a message eligible after a configured event sequence is observed.
  ///
  /// Event-sequence matching is experimental and may change.
  @experimental
  const factory MessageTrigger.eventSequence({
    /// Ordered events that must be observed before the message is eligible.
    required List<EventSequenceItem> events,

    /// Payload constraints carried with the sequence definition.
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
