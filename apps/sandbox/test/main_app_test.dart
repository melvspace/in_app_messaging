import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_messaging_drift/in_app_messaging_drift.dart';
import 'package:sandbox/main.dart';
import 'package:sandbox/providers/database.dart';
import 'package:sandbox/providers/in_app_messaging.dart';

void main() {
  testWidgets('storefront presents welcome and saved-item campaigns', (
    tester,
  ) async {
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
    await tester.pump();
    await tester.pump();

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Northstar Market'), findsOneWidget);
    expect(find.text('A little welcome gift'), findsOneWidget);

    await tester.tap(find.text('Start shopping'));
    await tester.pumpAndSettle();

    expect(find.text('Good afternoon, Maya'), findsOneWidget);
    expect(find.text('Restock your favorites'), findsOneWidget);

    await tester.tap(find.text('Browse collection'));
    await tester.pump();
    await tester.pump();

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -1200));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add viewed bundle'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Weekend bundle added'), findsOneWidget);

    await tester.drag(find.byType(CustomScrollView), const Offset(0, 1200));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Save Citrus olive oil'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Saved for later'), findsOneWidget);
    expect(find.text('Weekend bundle added'), findsNothing);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(minutes: 5));
  });
}
