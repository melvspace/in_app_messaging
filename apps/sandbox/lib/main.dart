import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:sandbox/features/iam/presentation/handles/dialog_message_handle/dialog_message_handle.dart';
import 'package:sandbox/providers/database.dart';
import 'package:sandbox/providers/in_app_messaging.dart';
import 'package:sandbox/providers/navigator.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(
      child: _EagerInitialization(
        child: MainApp(),
      ),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DynamicMessagePresenter(
      navigatorKey: ref.watch(navigatorProvider),
      initiallySuppressed: false,
      builders: {
        ...DialogMessageHandle.kFactories,
      },
      child: MaterialApp(
        navigatorKey: ref.watch(navigatorProvider),
        home: Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final dao = ref.read(databaseProvider).inAppMessagingDao;
                    dao.delete(dao.inAppMessageSeenDates).go();
                    dao.delete(dao.inAppMessageInteractions).go();
                  },
                  child: const Text('Clear Interactions'),
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Single Event'),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            InAppMessaging.instance
                                .trigger('message_event_1', {});
                          },
                          child: const Text('message_event_1'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            InAppMessaging.instance
                                .trigger('message_event_2', {});
                          },
                          child: const Text('message_event_2'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Eagerly initialize providers by watching them.
    // By using "watch", the provider will stay alive and not be disposed.
    ref.watch(inAppMessagingProvider);
    return child;
  }
}
