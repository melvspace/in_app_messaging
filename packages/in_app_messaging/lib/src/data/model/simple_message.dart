import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/src/core/typedefs.dart';
import '../../../in_app_messaging.dart';

part 'simple_message.freezed.dart';
part 'simple_message.g.dart';

@freezed
abstract class SimpleMessage with _$SimpleMessage implements DynamicMessage {
  const factory SimpleMessage({
    required String id,
    required bool enabled,
    required MessageType type,

    // display settings
    required DateTime start,
    DateTime? end,
    @Default(0) int priority,

    // triggers and conditions
    required List<MessageTrigger> triggers,
    JsonMap? condition,

    // custom properties
    required JsonMap data,
  }) = _SimpleMessage;

  factory SimpleMessage.fromJson(Map<String, dynamic> json) =>
      _$SimpleMessageFromJson(json);
}
