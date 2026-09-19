import 'package:flutter/material.dart';
import 'package:in_app_messaging/in_app_messaging.dart';

/// Presents lightweight in-app messages through the nearest scaffold messenger.
class TransientMessageHandle extends DynamicMessageHandle {
  /// Message type rendered as a persistent material banner.
  static const bannerType = MessageType(name: 'banner');

  /// Message type rendered as a floating snackbar notification.
  static const notificationType = MessageType(name: 'notification');

  /// Factories supported by this presentation handle.
  static final factories = {
    bannerType: (context) => TransientMessageHandle(context: context),
    notificationType: (context) => TransientMessageHandle(context: context),
  };

  /// Creates a handle for the selected message [context].
  TransientMessageHandle({required super.context});

  @override
  Future<PresentationAttempt> present(
    BuildContext context, [
    NavigatorState? navigator,
  ]) async {
    final hostContext = navigator?.context ?? context;
    final messenger = ScaffoldMessenger.maybeOf(hostContext);
    if (messenger == null) {
      return const PresentationAttempt.notShown(
        PresentationNotShownReason.declined,
      );
    }

    final data = _TransientMessageData.fromJson(this.context.message.data);
    final isBanner = this.context.message.type == bannerType;
    final completed = isBanner ? _showBanner(messenger, data) : null;
    if (!isBanner) {
      _showNotification(messenger, data);
    }

    await WidgetsBinding.instance.endOfFrame;
    return PresentationAttempt.shown(
      session: isBanner
          ? PresentationSession(completed: completed!)
          : PresentationSession.immediate(),
    );
  }

  Future<void> _showBanner(
    ScaffoldMessengerState messenger,
    _TransientMessageData data,
  ) {
    messenger.hideCurrentMaterialBanner();
    final controller = messenger.showMaterialBanner(
      MaterialBanner(
        elevation: 1,
        backgroundColor: const Color(0xFFFFF7E8),
        leading: const Icon(
          Icons.local_shipping_outlined,
          color: Color(0xFF9B4B00),
        ),
        content: _MessageCopy(data: data),
        actions: [
          TextButton(
            onPressed: messenger.hideCurrentMaterialBanner,
            child: Text(data.actionLabel),
          ),
        ],
      ),
    );
    return controller.closed.then<void>((_) {});
  }

  void _showNotification(
    ScaffoldMessengerState messenger,
    _TransientMessageData data,
  ) {
    messenger.removeCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        duration: const Duration(seconds: 4),
        margin: const EdgeInsets.all(16),
        content: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: _MessageCopy(data: data, compact: true)),
          ],
        ),
      ),
    );
  }
}

class _MessageCopy extends StatelessWidget {
  const _MessageCopy({required this.data, this.compact = false});

  final _TransientMessageData data;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final titleStyle = compact
        ? Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)
        : Theme.of(context).textTheme.titleSmall;
    final bodyStyle = compact
        ? Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70)
        : Theme.of(context).textTheme.bodySmall;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data.title, style: titleStyle),
        if (data.body case final body?) ...[
          const SizedBox(height: 2),
          Text(body, style: bodyStyle),
        ],
      ],
    );
  }
}

class _TransientMessageData {
  const _TransientMessageData({
    required this.title,
    required this.body,
    required this.actionLabel,
  });

  factory _TransientMessageData.fromJson(Map<String, dynamic> json) {
    return _TransientMessageData(
      title: json['title'] as String,
      body: json['body'] as String?,
      actionLabel: json['actionLabel'] as String? ?? 'Dismiss',
    );
  }

  final String title;
  final String? body;
  final String actionLabel;
}
