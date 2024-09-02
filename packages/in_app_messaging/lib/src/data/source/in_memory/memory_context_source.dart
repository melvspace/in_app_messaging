import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:in_app_messaging/in_app_messaging.dart';

class MemoryContextSource implements ContextSource {
  Map<String, dynamic> _context;

  MemoryContextSource({
    required Map<String, dynamic> context,
  }) : _context = context;

  @visibleForTesting
  DeviceContext getDevice() {
    return DeviceContext.fromJson(_context['device'].cast<String, dynamic>());
  }

  @visibleForTesting
  UserContext getUser() {
    return UserContext.fromJson(_context['user'].cast<String, dynamic>());
  }

  @visibleForTesting
  void updateUserProperty(String key, dynamic value) {
    _context = {
      ..._context,
      "user": {..._context['user'], key: value}
    };
  }

  @visibleForTesting
  void updateDeviceProperty(String key, dynamic value) {
    _context = {
      ..._context,
      "device": {..._context['device'], key: value}
    };
  }

  @override
  Map<String, dynamic> get context => UnmodifiableMapView(_context);
}
