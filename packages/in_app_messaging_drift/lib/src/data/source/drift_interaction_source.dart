import 'dart:async';

import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging_drift/src/data/dao/in_app_messaging_dao.dart';

class DriftInteractionSource implements InteractionSource {
  final InAppMessagingDao _dao;

  DriftInteractionSource({required InAppMessagingDao dao}) : _dao = dao;

  @override
  Future<MessageInteractions> getInteractions(String id) async {
    final seenEntries = await _dao.getSeenEntries(id);

    return MessageInteractions(
      message: id,
      seenEntries: seenEntries,
    );
  }

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
