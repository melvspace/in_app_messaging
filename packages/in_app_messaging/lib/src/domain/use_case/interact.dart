import 'dart:async';

import 'package:in_app_messaging/src/domain/entity/messages/message.dart';

import '../../../in_app_messaging.dart';

class Interact {
  final Message message;
  final MessageGateway gateway;

  Interact({
    required this.message,
    required this.gateway,
  });

  FutureOr<void> execute<T>(String key, T data) async {
    await gateway.interact(message.id, key, data);
  }
}
