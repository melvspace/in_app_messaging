import 'dart:async';

import 'package:in_app_messaging/src/domain/entity/context/device_context.dart';
import 'package:in_app_messaging/src/domain/entity/context/user_context.dart';

abstract interface class ContextSource {
  FutureOr<UserContext> getUser();

  FutureOr<DeviceContext> getDevice();

  FutureOr<void> updateUserProperty(String key, dynamic value);

  FutureOr<void> updateDeviceProperty(String key, dynamic value);
}
