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
  Future<void> onShow(BuildContext context, [NavigatorState? navigator]) {
    return showDialog(
      context: navigator?.context ?? context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              data.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (data.body case String body) //
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(body),
              ),
            for (final action in data.actions)
              ElevatedButton(
                onPressed: () {
                  switch (action.click) {
                    case DialogPopClickAction():
                      Navigator.of(context).pop();
                      for (final event in action.events) {
                        InAppMessaging.instance.trigger(event, {});
                      }
                  }
                },
                child: Text(action.text),
              ),
          ],
        ),
      ),
    );
  }
}
