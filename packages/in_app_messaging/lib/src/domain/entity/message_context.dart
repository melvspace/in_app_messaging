import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/in_app_messaging.dart';

part 'message_context.freezed.dart';

/// Snapshot carried from message selection into presentation.
///
/// The gateway builds this after a message passes trigger, schedule, and
/// condition checks. Presentation handles receive the same snapshot that will
/// be used to record seen state.
@Freezed(unionKey: 'type')
sealed class MessageContext with _$MessageContext {
  const MessageContext._();

  /// Creates a snapshot for a dynamically triggered message.
  const factory MessageContext.dynamic({
    /// Message selected for presentation.
    required DynamicMessage message,

    /// Trigger instance that selected [message].
    required MessageTrigger trigger,

    /// Interaction history loaded before condition evaluation.
    required MessageInteractions interactions,

    /// User, device, and environment data available to conditions.
    required Map<String, dynamic> context,
  }) = DynamicMessageContext;
}
