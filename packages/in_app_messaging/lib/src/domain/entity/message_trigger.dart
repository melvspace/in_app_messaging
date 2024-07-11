import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/src/domain/entity/triggers/event_sequence_item.dart';

part 'message_trigger.freezed.dart';
part 'message_trigger.g.dart';

@Freezed(unionKey: 'type')
sealed class MessageTrigger with _$MessageTrigger {
  const MessageTrigger._();

  @experimental
  const factory MessageTrigger.cron({
    required String cron,

    /// Event triggered when cron schedule activated
    ///
    /// By default message will be triggered when cron activated
    ///
    /// If event provided then event will be sent. Can be used for event sequences.
    String? event,
  }) = MessageCronTrigger;

  const factory MessageTrigger.event({
    required String event,

    /// Optional trigger payload
    @Default({}) Map<String, dynamic>? data,
  }) = MessageEventTrigger;

  /// Sequence of events
  ///
  /// Example:
  ///   - exam_completed, exam_closed, diploma_form_opened, diploma_form_closed
  ///   - exam_completed, exam_closed, !diploma_form_opened(for 2 seconds)
  ///
  /// TODO(@melvspace): 07/11/24 figure out how to persist events
  @experimental
  const factory MessageTrigger.eventSequence({
    required List<EventSequenceItem> events,

    /// Optional trigger payload
    required List<Map<String, dynamic>?> data,
  }) = MessageEventSequenceTrigger;

  /// Checks if [trigger] is inside of [this], i.e. [this] has all properties of [trigger]
  ///
  /// Useful to check if more complete trigger eligible for some concrete trigger
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

  factory MessageTrigger.fromJson(Map<String, dynamic> json) =>
      _$MessageTriggerFromJson(json);
}
