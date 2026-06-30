import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_messaging_drift/in_app_messaging_drift.dart';
import 'package:sandbox/main.dart';
import 'package:sandbox/providers/database.dart';
import 'package:sandbox/providers/in_app_messaging.dart';

void main() {
  testWidgets('MainApp pumps with in-memory database override', (tester) async {
    final database = InAppMessagingDatabase(
      executor: NativeDatabase.memory(),
    );
    addTearDown(database.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(database),
        ],
        child: Consumer(
          builder: (context, ref, child) {
            ref.watch(inAppMessagingProvider);
            return const MainApp();
          },
        ),
      ),
    );

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Clear Interactions'), findsOneWidget);
    expect(find.text('message_event_1'), findsOneWidget);
    expect(find.text('message_event_2'), findsOneWidget);
  });
}
