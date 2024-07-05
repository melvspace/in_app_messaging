import 'dart:async';
import 'dart:developer';

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
    _user = _user.change(key, value);
    log('[MemoryContextSource.updateUserProperty]: user updated - ${_device.toJson()}');
  }

  @override
  FutureOr<void> updateDeviceProperty(String key, dynamic value) {
    _device = DeviceContext.fromJson(_device.toJson()..[key] = value);
    log('[MemoryContextSource.updateDeviceProperty]: device updated - ${_device.toJson()}');
  }
}
