import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging_drift/in_app_messaging_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sandbox/providers/database.dart';
import 'package:sandbox/providers/messages.dart';

part 'in_app_messaging.g.dart';

@riverpod
InAppMessaging inAppMessaging(InAppMessagingRef ref) {
  return InAppMessaging.initialize(
    gateway: DefaultMessageGateway(
      messageSource: MemoryMessageSource(
        messages: ref.watch(iamMessagesProvider),
      ),
      interactionSource: DriftInteractionSource(
        dao: ref.watch(databaseProvider).inAppMessagingDao,
      ),
      contextSource: MemoryContextSource(
        device: const DeviceContext(
          platform: 'android',
          version: '1.0.0',
          versionNumber: '123',
          language: 'en',
        ),
        user: const UserContext(),
      ),
    ),
  );
}
