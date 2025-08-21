import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_messaging/src/domain/entity/interaction/message_seen_entry.dart';

part 'message_interactions.freezed.dart';
part 'message_interactions.g.dart';

/// Message persisted interactions
@freezed
abstract class MessageInteractions with _$MessageInteractions {
  const factory MessageInteractions({
    /// message id
    required String message,

    /// dates when user seend this message
    required List<MessageSeenEntry> seenEntries,
  }) = _MessageInteractions;

  factory MessageInteractions.fromJson(Map<String, dynamic> json) =>
      _$MessageInteractionsFromJson(json);
}
