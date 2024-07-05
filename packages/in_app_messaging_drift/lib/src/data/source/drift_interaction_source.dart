import 'dart:async';

import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging_drift/src/data/dao/in_app_messaging_dao.dart';

class DriftInteractionSource implements InteractionSource {
  final InAppMessagingDao _dao;

  DriftInteractionSource({required InAppMessagingDao dao}) : _dao = dao;

  @override
  Future<MessageInteractions> getInteractions(String id) async {
    final interactions = await _dao.getInteractions(id);

    return MessageInteractions(
      message: id,
      seenDates: interactions.seenDates,
      additional: interactions.additional,
    );
  }

  @override
  Future<void> interact<T>(String id, String key, T data) async {
    await _dao.interact(id, key, data);
  }

  @override
  Future<void> markSeen(String id) async {
    await _dao.markSeen(id);
  }
}
