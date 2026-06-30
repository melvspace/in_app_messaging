import 'dart:async';

import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging_drift/src/data/dao/in_app_messaging_dao.dart';

/// Persistent interaction source for seen history.
class DriftInteractionSource implements InteractionSource {
  final InAppMessagingDao _dao;

  /// Uses [dao] to access persisted interaction history.
  DriftInteractionSource({required InAppMessagingDao dao}) : _dao = dao;

  /// Loads seen history for [id].
  @override
  Future<MessageInteractions> getInteractions(String id) async {
    final seenEntries = await _dao.getSeenEntries(id);

    return MessageInteractions(
      message: id,
      seenEntries: seenEntries,
    );
  }

  /// Records a visible presentation.
  @override
  Future<void> markSeen({
    required String id,
    String? trigger,
    Map<String, dynamic>? triggerProperties,
  }) async {
    await _dao.markSeen(
      id: id,
      trigger: trigger,
      triggerProperties: triggerProperties,
    );
  }
}
