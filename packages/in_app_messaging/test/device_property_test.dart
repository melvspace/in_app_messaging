import 'package:checks/checks.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:test/test.dart';

void main() {
  test('set device property works fine', () async {
    final context = MemoryContextSource(
      context: {
        "device": {
          "platform": 'platform',
          "version": 'version',
          "version_number": 'versionNumber',
          "language": 'language',
        },
        "user": {}
      },
    );

    await check(Future(() => context.updateDeviceProperty('platform', 'other')))
        .completes((r) {});

    check(Future(() => context.getDevice())) //
        .completes(//
            (it) => it //
                .has((it) => it.getByKey('platform'), 'platform')
                .equals('other'));
  });
}
