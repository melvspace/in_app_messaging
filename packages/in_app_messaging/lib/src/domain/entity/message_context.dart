import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging/src/domain/entity/message_slot.dart';
import 'package:in_app_messaging/src/domain/entity/messages/message.dart';
import 'package:in_app_messaging/src/domain/entity/messages/static_message.dart';

part 'message_context.freezed.dart';

/// MessageContext used to evaluate expression and possibly fill templates
@Freezed(unionKey: 'type')
class MessageContext with _$MessageContext {
  const MessageContext._();

  @override
  Message get message;

  const factory MessageContext.static({
    required StaticMessage message,

    /// For Trigger conditions
    required MessageSlot slot,

    /// For Interactions conditions
    required MessageInteractions interactions,

    /// For Interactions conditions
    required UserContext user,
    required DeviceContext device,

    /// Interaction use case
    required Interact interact,
  }) = StaticMessageContext;

  const factory MessageContext.dynamic({
    required DynamicMessage message,

    /// For Trigger conditions
    required MessageTrigger trigger,

    /// For Interactions conditions
    required MessageInteractions interactions,

    /// For Interactions conditions
    required UserContext user,
    required DeviceContext device,

    /// Interaction use case
    required Interact interact,
  }) = DynamicMessageContext;
}
