import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_slot.freezed.dart';
part 'message_slot.g.dart';

/// Named placement where presentation code may choose to render a message.
@Freezed(unionKey: 'type')
sealed class MessageSlot with _$MessageSlot {
  /// Creates a render placement.
  const factory MessageSlot({
    /// Placement identifier agreed on by message data and presentation code.
    required String id,
  }) = _MessageSlot;

  /// Parses a render placement from JSON.
  factory MessageSlot.fromJson(Map<String, dynamic> json) =>
      _$MessageSlotFromJson(json);
}
