import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_type.freezed.dart';
part 'message_type.g.dart';

@freezed
class MessageType with _$MessageType {
  const factory MessageType({required String name}) = _MessageType;

  factory MessageType.fromJson(Map<String, dynamic> json) =>
      _$MessageTypeFromJson(json);
}
