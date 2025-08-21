import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_seen_entry.freezed.dart';
part 'message_seen_entry.g.dart';

@freezed
abstract class MessageSeenEntry with _$MessageSeenEntry {
  const factory MessageSeenEntry({
    required DateTime date,
    String? trigger,
    Map<String, dynamic>? triggerProperties,
  }) = _MessageSeenEntry;

  factory MessageSeenEntry.fromJson(Map<String, dynamic> json) =>
      _$MessageSeenEntryFromJson(json);
}
