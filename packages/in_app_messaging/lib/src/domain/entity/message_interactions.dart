import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_interactions.freezed.dart';

/// Message persisted interactions
@freezed
class MessageInteractions with _$MessageInteractions {
  const factory MessageInteractions({
    /// message id
    required String message,

    /// dates when user seend this message
    required List<DateTime> seenDates,

    /// additional dynamic interactions
    required Map<String, dynamic> additional,
  }) = _MessageInteractions;
}
