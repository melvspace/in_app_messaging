import 'package:checks/checks.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:test/test.dart';

void main() {
  test('set device property works fine', () async {
    final context = MemoryContextSource(
      device: const DeviceContext(
        platform: 'platform',
        version: 'version',
        versionNumber: 'versionNumber',
        language: 'language',
      ),
      user: const UserContext(),
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
