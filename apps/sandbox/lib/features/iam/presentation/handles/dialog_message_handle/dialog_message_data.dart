import 'package:freezed_annotation/freezed_annotation.dart';

part 'dialog_message_data.freezed.dart';
part 'dialog_message_data.g.dart';

@freezed
class DialogMessageData with _$DialogMessageData {
  const factory DialogMessageData({
    required String title,
    String? body,
    @Default([]) List<DialogMessageAction> actions,
  }) = _DialogMessageData;

  factory DialogMessageData.fromJson(Map<String, dynamic> json) =>
      _$DialogMessageDataFromJson(json);
}

@freezed
class DialogMessageAction with _$DialogMessageAction {
  const factory DialogMessageAction({
    required String text,
    DialogMessageDataClick? click,
    @Default([]) List<String> events,
  }) = _DialogMessageAction;

  factory DialogMessageAction.fromJson(Map<String, dynamic> json) =>
      _$DialogMessageActionFromJson(json);
}

@freezed
class DialogMessageDataClick with _$DialogMessageDataClick {
  const factory DialogMessageDataClick.pop() = DialogPopClickAction;

  factory DialogMessageDataClick.fromJson(Map<String, dynamic> json) =>
      _$DialogMessageDataClickFromJson(json);
}
