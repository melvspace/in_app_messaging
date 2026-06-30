import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_type.freezed.dart';
part 'message_type.g.dart';

/// Handle routing key for a message's presentation format.
@freezed
abstract class MessageType with _$MessageType {
  /// Creates a presentation routing key.
  const factory MessageType({
    /// Name used to find a [DynamicMessageHandleFactory].
    required String name,
  }) = _MessageType;

  /// Parses a presentation routing key from JSON.
  factory MessageType.fromJson(Map<String, dynamic> json) =>
      _$MessageTypeFromJson(json);
}
