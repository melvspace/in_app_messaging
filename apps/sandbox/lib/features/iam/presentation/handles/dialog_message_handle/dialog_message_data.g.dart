// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_message_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DialogMessageData _$DialogMessageDataFromJson(Map<String, dynamic> json) =>
    _DialogMessageData(
      title: json['title'] as String,
      body: json['body'] as String?,
      actions: (json['actions'] as List<dynamic>?)
              ?.map((e) =>
                  DialogMessageAction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DialogMessageDataToJson(_DialogMessageData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'actions': instance.actions,
    };

_DialogMessageAction _$DialogMessageActionFromJson(Map<String, dynamic> json) =>
    _DialogMessageAction(
      text: json['text'] as String,
      click: json['click'] == null
          ? null
          : DialogMessageDataClick.fromJson(
              json['click'] as Map<String, dynamic>),
      events: (json['events'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DialogMessageActionToJson(
        _DialogMessageAction instance) =>
    <String, dynamic>{
      'text': instance.text,
      'click': instance.click,
      'events': instance.events,
    };

DialogPopClickAction _$DialogPopClickActionFromJson(
        Map<String, dynamic> json) =>
    DialogPopClickAction();

Map<String, dynamic> _$DialogPopClickActionToJson(
        DialogPopClickAction instance) =>
    <String, dynamic>{};
