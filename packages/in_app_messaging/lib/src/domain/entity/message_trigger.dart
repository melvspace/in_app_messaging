import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_trigger.freezed.dart';
part 'message_trigger.g.dart';

@Freezed(unionKey: 'type')
sealed class MessageTrigger with _$MessageTrigger {
  const MessageTrigger._();

  const factory MessageTrigger.event({
    required String event,

    /// Optional trigger payload
    required Map<String, dynamic>? data,
  }) = MessageEventTrigger;

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
