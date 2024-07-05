import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/in_app_messaging.dart';

part 'message_with_context.freezed.dart';

@freezed
class MessageWithContext with _$MessageWithContext {
  const factory MessageWithContext({
    required Message message,
    required MessageContext context,
    required Interact interact,
  }) = _MessageWithContext;
}
