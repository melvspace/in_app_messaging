import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/src/domain/entity/context/device_context.dart';
import 'package:in_app_messaging/src/domain/entity/context/user_context.dart';
import 'message_interactions.dart';
import 'message_trigger.dart';

part 'message_context.freezed.dart';
part 'message_context.g.dart';

/// MessageContext used to evaluate expression and possibly fill templates
@freezed
class MessageContext with _$MessageContext {
  const factory MessageContext({
    /// For Trigger conditions
    required MessageTrigger trigger,

    /// For Interactions conditions
    required MessageInteractions interactions,

    /// For Interactions conditions
    required UserContext user,
    required DeviceContext device,
  }) = _MessageContext;

  factory MessageContext.fromJson(Map<String, dynamic> json) =>
      _$MessageContextFromJson(json);
}
