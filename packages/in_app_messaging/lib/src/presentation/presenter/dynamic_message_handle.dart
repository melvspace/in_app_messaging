import 'dart:async';

import 'package:flutter/widgets.dart';
import '../../../in_app_messaging.dart';

/// Adapter that turns selected message data into UI.
abstract class DynamicMessageHandle {
  /// Selection snapshot passed from the gateway.
  final MessageContext context;

  /// Binds a handle to the selected [context].
  DynamicMessageHandle({required this.context});

  /// Starts presentation and reports whether the message became visible.
  ///
  /// Returning [PresentationAttempt.shown] is the point where the facade records
  /// a seen entry. Use [PresentationSession.completed] to keep the presenter
  /// from starting the next queued message until the visible surface closes.
  FutureOr<PresentationAttempt> present(
    BuildContext context, [
    NavigatorState? navigator,
  ]);
}
