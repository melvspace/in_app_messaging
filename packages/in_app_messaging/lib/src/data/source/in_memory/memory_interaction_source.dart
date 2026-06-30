import 'dart:async';

import 'package:in_app_messaging/src/domain/entity/interaction/message_seen_entry.dart';

import '../interaction_source.dart';
import '../../../domain/entity/message_interactions.dart';

/// Volatile interaction source for tests and demos.
class MemoryInteractionSource implements InteractionSource {
  final Map<String, List<MessageSeenEntry>> _seenEntries = {};

  /// Returns seen entries recorded for [id].
  @override
  FutureOr<MessageInteractions> getInteractions(String id) {
    return MessageInteractions(
      message: id,
      seenEntries: _seenEntries[id] ?? [],
    );
  }

  /// Records a visible presentation for [id].
  @override
  FutureOr<void> markSeen({
    required String id,
    String? trigger,
    Map<String, dynamic>? triggerProperties,
  }) {
    _seenEntries.putIfAbsent(id, () => []).add(
          MessageSeenEntry(
            date: DateTime.now(),
            trigger: trigger,
            triggerProperties: triggerProperties,
          ),
        );
  }
}
