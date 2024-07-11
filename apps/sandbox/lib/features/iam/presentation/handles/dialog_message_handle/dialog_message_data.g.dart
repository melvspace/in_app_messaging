// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_message_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DialogMessageDataImpl _$$DialogMessageDataImplFromJson(
        Map<String, dynamic> json) =>
    _$DialogMessageDataImpl(
      title: json['title'] as String,
      body: json['body'] as String?,
      actions: (json['actions'] as List<dynamic>?)
              ?.map((e) =>
                  DialogMessageAction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DialogMessageDataImplToJson(
        _$DialogMessageDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'actions': instance.actions,
    };

_$DialogMessageActionImpl _$$DialogMessageActionImplFromJson(
        Map<String, dynamic> json) =>
    _$DialogMessageActionImpl(
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

Map<String, dynamic> _$$DialogMessageActionImplToJson(
        _$DialogMessageActionImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'click': instance.click,
      'events': instance.events,
    };

_$DialogPopClickActionImpl _$$DialogPopClickActionImplFromJson(
        Map<String, dynamic> json) =>
    _$DialogPopClickActionImpl();

Map<String, dynamic> _$$DialogPopClickActionImplToJson(
        _$DialogPopClickActionImpl instance) =>
    <String, dynamic>{};
