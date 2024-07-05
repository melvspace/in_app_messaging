import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_type.freezed.dart';

@freezed
class MessageType with _$MessageType {
  const factory MessageType({required String name}) = _MessageType;
}
