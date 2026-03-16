import 'package:flutter/material.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:in_app_messaging/src/in_app_messaging_logger.dart';

class InAppMessagingSuppressor extends StatefulWidget {
  final Widget child;

  const InAppMessagingSuppressor({
    super.key,
    required this.child,
  });

  @override
  State<InAppMessagingSuppressor> createState() =>
      _InAppMessagingSuppressorState();
}

class _InAppMessagingSuppressorState extends State<InAppMessagingSuppressor> {
  final String _key = UniqueKey().toString();

  @override
  void initState() {
    super.initState();

    logger.info(
      '[InAppMessagingSuppressor]: starting to suppress messages, key: $_key',
    );

    InAppMessaging.instance.setSuppressed(true, key: _key);
  }

  @override
  void dispose() {
    logger.info(
      '[InAppMessagingSuppressor]: stopping to suppress messages, key: $_key',
    );

    InAppMessaging.instance.setSuppressed(
      false,
      key: _key,
      bufferDuration: const Duration(milliseconds: 1000),
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
