import 'dart:async';

import '../../../in_app_messaging.dart';

abstract interface class MessageSource {
  FutureOr<List<Message>> fetchMessages();
}
