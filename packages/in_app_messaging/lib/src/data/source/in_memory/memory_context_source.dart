import 'dart:async';

import 'package:in_app_messaging/in_app_messaging.dart';

class MemoryContextSource implements ContextSource {
  DeviceContext _device;
  UserContext _user;

  MemoryContextSource({
    required DeviceContext device,
    required UserContext user,
  })  : _device = device,
        _user = user;

  @override
  FutureOr<DeviceContext> getDevice() {
    return _device;
  }

  @override
  FutureOr<UserContext> getUser() {
    return _user;
  }

  @override
  FutureOr<void> updateUserProperty(String key, dynamic value) {
    _user = UserContext.fromJson(_user.toJson()..[key] = value);
  }

  @override
  FutureOr<void> updateDeviceProperty(String key, dynamic value) {
    _device = DeviceContext.fromJson(_device.toJson()..[key] = value);
  }
}
