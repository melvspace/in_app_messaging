import 'dart:async';

import 'package:in_app_messaging/src/domain/entity/messages/message.dart';

abstract interface class MessageSource {
  FutureOr<List<Message>> fetchMessages();
}
