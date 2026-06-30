import 'dart:async';

import 'package:in_app_messaging/src/domain/entity/interaction/message_seen_entry.dart';

import '../interaction_source.dart';
import '../../../domain/entity/message_interactions.dart';

/// In-memory interaction source whose history lasts for this source instance.
///
/// Use this for tests, demos, and sandbox flows where seen history should not
/// survive app restart or source replacement.
class MemoryInteractionSource implements InteractionSource {
  final Map<String, List<MessageSeenEntry>> _seenEntries = {};

  /// Loads seen entries recorded on this instance for [id].
  ///
  /// Returns empty history when no visible presentation has been recorded.
  @override
  FutureOr<MessageInteractions> getInteractions(String id) {
    return MessageInteractions(
      message: id,
      seenEntries: _seenEntries[id] ?? [],
    );
  }

  /// Records a visible presentation for [id] using the current wall-clock time.
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
