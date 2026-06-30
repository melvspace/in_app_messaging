import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:in_app_messaging/in_app_messaging.dart';

/// Volatile context source for tests and demos.
class MemoryContextSource implements ContextSource {
  Map<String, dynamic> _context;

  /// Uses [context] as the initial condition input.
  MemoryContextSource({
    required Map<String, dynamic> context,
  }) : _context = context;

  /// Reads the current `device` branch as typed data.
  @visibleForTesting
  DeviceContext getDevice() {
    return DeviceContext.fromJson(_context['device'].cast<String, dynamic>());
  }

  /// Reads the current `user` branch as typed data.
  @visibleForTesting
  UserContext getUser() {
    return UserContext.fromJson(_context['user'].cast<String, dynamic>());
  }

  /// Replaces one key under the `user` branch.
  @visibleForTesting
  void updateUserProperty(String key, dynamic value) {
    _context = {
      ..._context,
      "user": {..._context['user'], key: value}
    };
  }

  /// Replaces one key under the `device` branch.
  @visibleForTesting
  void updateDeviceProperty(String key, dynamic value) {
    _context = {
      ..._context,
      "device": {..._context['device'], key: value}
    };
  }

  /// Read-only view of the current condition input.
  @override
  Map<String, dynamic> get context => UnmodifiableMapView(_context);
}
