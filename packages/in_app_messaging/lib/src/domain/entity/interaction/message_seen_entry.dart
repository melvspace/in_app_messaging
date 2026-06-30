import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_seen_entry.freezed.dart';
part 'message_seen_entry.g.dart';

/// Record written when a selected message actually becomes visible.
@freezed
abstract class MessageSeenEntry with _$MessageSeenEntry {
  /// Creates a persisted visibility record.
  const factory MessageSeenEntry({
    /// Time when presentation reported the message as shown.
    required DateTime date,

    /// Event name that selected the message, when the trigger was an event.
    String? trigger,

    /// Event payload captured with [trigger] for recurrence checks.
    Map<String, dynamic>? triggerProperties,
  }) = _MessageSeenEntry;

  /// Parses a seen entry from JSON.
  factory MessageSeenEntry.fromJson(Map<String, dynamic> json) =>
      _$MessageSeenEntryFromJson(json);
}
