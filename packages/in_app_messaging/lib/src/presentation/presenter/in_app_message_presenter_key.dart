import 'package:flutter/widgets.dart';
import 'package:in_app_messaging/src/presentation/presenter/dynamic_message_presenter.dart';

/// Global key used by [InAppMessaging] to reach the active presenter.
final GlobalKey<DynamicMessagePresenterState> inAppMessagePresenterKey =
    GlobalKey();
