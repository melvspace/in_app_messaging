import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../in_app_messaging.dart';

part 'simple_message.freezed.dart';

@freezed
class SimpleMessage with _$SimpleMessage implements DynamicMessage {
  const factory SimpleMessage({
    required String id,
    required bool enabled,
    required MessageType type,

    //
    required DateTime start,
    required DateTime? end,

    // triggers and conditions
    required List<MessageTrigger> triggers,
    required MessageCondition? condition,

    // custom properties
    required Map<String, dynamic> data,
  }) = _SimpleMessage;
}
