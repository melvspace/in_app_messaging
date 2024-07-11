import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_slot.freezed.dart';
part 'message_slot.g.dart';

@Freezed(unionKey: 'type')
sealed class MessageSlot with _$MessageSlot {
  const factory MessageSlot({
    required String id,
  }) = _MessageSlot;

  factory MessageSlot.fromJson(Map<String, dynamic> json) =>
      _$MessageSlotFromJson(json);
}
