import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../in_app_messaging.dart';

part 'simple_message.freezed.dart';

@freezed
class SimpleMessage with _$SimpleMessage implements Message {
  const factory SimpleMessage({
    required String id,
    required MessageType type,
    required MessageCondition condition,
    required Map<String, dynamic> data,
  }) = _SimpleMessage;
}
