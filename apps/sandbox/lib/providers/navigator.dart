import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigator.g.dart';

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> navigator(Ref ref) {
  return GlobalKey();
}
