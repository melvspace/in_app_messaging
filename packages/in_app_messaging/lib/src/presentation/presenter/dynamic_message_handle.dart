import 'dart:async';

import 'package:flutter/widgets.dart';
import '../../../in_app_messaging.dart';

abstract class DynamicMessageHandle {
  final MessageContext context;

  DynamicMessageHandle({required this.context});

  FutureOr<PresentationAttempt> present(
    BuildContext context, [
    NavigatorState? navigator,
  ]);
}
