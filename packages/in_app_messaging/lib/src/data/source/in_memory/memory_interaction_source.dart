import 'dart:async';

import '../interaction_source.dart';
import '../../../domain/entity/message_interactions.dart';

class MemoryInteractionSource implements InteractionSource {
  final Map<String, Map<String, dynamic>> _interactions = {};
  final Map<String, List<DateTime>> _seenDates = {};

  @override
  FutureOr<MessageInteractions> getInteractions(String id) {
    return MessageInteractions(
      message: id,
      seenDates: _seenDates[id] ?? [],
      additional: _interactions[id] ?? {},
    );
  }

  @override
  FutureOr<void> interact<T>(String id, String key, T data) {
    _interactions.putIfAbsent(id, () => {})[key] = data;
  }

  @override
  FutureOr<void> markSeen(String id) {
    _seenDates.putIfAbsent(id, () => []).add(DateTime.now());
  }
}
