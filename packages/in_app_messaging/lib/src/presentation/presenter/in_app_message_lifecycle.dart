import 'dart:async';

import 'package:flutter/widgets.dart';
import '../../../in_app_messaging.dart';

abstract class InAppMessageLifecycle {
  final MessageWithContext tuple;

  InAppMessageLifecycle({required this.tuple});

  Future<void> onShow(BuildContext context, [NavigatorState? navigator]);
}
