import 'package:flutter/material.dart';
import 'package:in_app_messaging/in_app_messaging.dart';
import 'package:sandbox/features/iam/presentation/handles/dialog_message_handle/dialog_message_data.dart';

class DialogMessageHandle extends DynamicMessageHandle {
  static const kType = MessageType(name: 'dialog');
  static final kFactories = {
    DialogMessageHandle.kType: (context) =>
        DialogMessageHandle(context: context),
  };

  final DialogMessageData data;

  DialogMessageHandle({required super.context})
      : data = DialogMessageData.fromJson(context.message.data);

  @override
  Future<PresentationAttempt> present(
    BuildContext context, [
    NavigatorState? navigator,
  ]) async {
    final completed = showDialog<void>(
      context: navigator?.context ?? context,
      builder: (context) => Dialog(
        clipBehavior: Clip.antiAlias,
        insetPadding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 24, 28, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFE4C7),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.auto_awesome_outlined,
                    color: Color(0xFF9B4B00),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  data.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                if (data.body case String body) ...[
                  const SizedBox(height: 10),
                  Text(
                    body,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          height: 1.45,
                        ),
                  ),
                ],
                if (data.actions.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (final (index, action) in data.actions.indexed) ...[
                        if (index > 0) const SizedBox(width: 8),
                        if (index == 0)
                          FilledButton(
                            onPressed: () => _performAction(context, action),
                            child: Text(action.text),
                          )
                        else
                          TextButton(
                            onPressed: () => _performAction(context, action),
                            child: Text(action.text),
                          ),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );

    await WidgetsBinding.instance.endOfFrame;

    return PresentationAttempt.shown(
      session: PresentationSession(completed: completed),
    );
  }

  void _performAction(BuildContext context, DialogMessageAction action) {
    switch (action.click) {
      case DialogPopClickAction():
        Navigator.of(context).pop();
        for (final event in action.events) {
          InAppMessaging.instance.trigger(event, {});
        }
      case null:
        Navigator.of(context).pop();
    }
  }
}
