import 'package:checks/checks.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:test/test.dart';

void main() {
  test('set user property works fine', () async {
    final context = MemoryContextSource(
      context: {
        "device": {
          'platform': 'platform',
          'version': 'version',
          'versionNumber': 'versionNumber',
          'language': 'language',
        },
        "user": {},
      },
    );

    await check(Future(() => context.updateUserProperty('app_language', 'en')))
        .completes((r) {});

    check(Future(() => context.getUser())) //
        .completes(//
            (it) => it
                .has((it) => it.getByKey('app_language'), 'app_language')
                .equals('en'));
  });
}
