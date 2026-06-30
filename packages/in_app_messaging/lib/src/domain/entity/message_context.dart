import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/in_app_messaging.dart';

part 'message_context.freezed.dart';

/// Snapshot carried from message eligibility into presentation.
///
/// It captures the message, trigger, interaction history, and targeting data
/// that were valid for one presentation attempt. The same snapshot is provided
/// to the presentation handle and used when recording seen state.
@Freezed(unionKey: 'type')
sealed class MessageContext with _$MessageContext {
  const MessageContext._();

  /// Creates a presentation snapshot for a runtime-triggered message.
  const factory MessageContext.dynamic({
    /// Message definition selected for this presentation attempt.
    required DynamicMessage message,

    /// Runtime trigger that matched [message].
    required MessageTrigger trigger,

    /// Seen history that was available when eligibility was evaluated.
    required MessageInteractions interactions,

    /// User, device, and environment data used by targeting rules.
    required Map<String, dynamic> context,
  }) = DynamicMessageContext;
}
