import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/in_app_messaging.dart';

part 'message_context.freezed.dart';

/// MessageContext used to evaluate expression and possibly fill templates
@Freezed(unionKey: 'type')
class MessageContext with _$MessageContext {
  const MessageContext._();

  const factory MessageContext.dynamic({
    required DynamicMessage message,

    /// For Trigger conditions
    required MessageTrigger trigger,

    /// For Interactions conditions
    required MessageInteractions interactions,

    /// For Interactions conditions
    required UserContext user,
    required DeviceContext device,
  }) = DynamicMessageContext;
}
