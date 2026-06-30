import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/src/domain/entity/interaction/message_seen_entry.dart';

part 'message_interactions.freezed.dart';
part 'message_interactions.g.dart';

/// Interaction history consulted while evaluating recurrence conditions.
@freezed
abstract class MessageInteractions with _$MessageInteractions {
  /// Creates interaction history for one message.
  const factory MessageInteractions({
    /// Message id these interactions belong to.
    required String message,

    /// Seen entries used to build `interactions.last_seen` and
    /// `interactions.seen_entries` in condition data.
    required List<MessageSeenEntry> seenEntries,
  }) = _MessageInteractions;

  /// Parses interaction history from JSON.
  factory MessageInteractions.fromJson(Map<String, dynamic> json) =>
      _$MessageInteractionsFromJson(json);
}
