// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageContextImpl _$$MessageContextImplFromJson(Map<String, dynamic> json) =>
    _$MessageContextImpl(
      trigger: MessageTrigger.fromJson(json['trigger'] as Map<String, dynamic>),
      interactions: MessageInteractions.fromJson(
          json['interactions'] as Map<String, dynamic>),
      user: UserContext.fromJson(json['user'] as Map<String, dynamic>),
      device: DeviceContext.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageContextImplToJson(
        _$MessageContextImpl instance) =>
    <String, dynamic>{
      'trigger': instance.trigger,
      'interactions': instance.interactions,
      'user': instance.user,
      'device': instance.device,
    };
