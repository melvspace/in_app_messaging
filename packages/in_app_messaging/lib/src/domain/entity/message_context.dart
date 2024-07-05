import 'package:freezed_annotation/freezed_annotation.dart';
import 'message_interactions.dart';
import 'message_trigger.dart';

part 'message_context.freezed.dart';

@freezed
class MessageContext with _$MessageContext {
  const factory MessageContext({
    /// For Trigger conditions
    required MessageTrigger trigger,

    /// For Interactions conditions
    required MessageInteractions interactions,
    // TODO(@melvspace): 07/05/24 add user info - User Property Conditions
    // TODO(@melvspace): 07/05/24 add device info - Device Property Conditions
  }) = _MessageContext;
}
