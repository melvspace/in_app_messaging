import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_trigger.freezed.dart';

@freezed
sealed class MessageTrigger with _$MessageTrigger {
  const factory MessageTrigger.event({
    required String event,

    /// Optional trigger payload
    required Map<String, dynamic>? data,
  }) = MessageEventTrigger;
}
