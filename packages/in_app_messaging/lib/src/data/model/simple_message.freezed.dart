// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SimpleMessage {
  String get id => throw _privateConstructorUsedError;
  MessageType get type => throw _privateConstructorUsedError;
  List<MessageTrigger> get triggers => throw _privateConstructorUsedError;
  MessageCondition? get condition => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SimpleMessageCopyWith<SimpleMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleMessageCopyWith<$Res> {
  factory $SimpleMessageCopyWith(
          SimpleMessage value, $Res Function(SimpleMessage) then) =
      _$SimpleMessageCopyWithImpl<$Res, SimpleMessage>;
  @useResult
  $Res call(
      {String id,
      MessageType type,
      List<MessageTrigger> triggers,
      MessageCondition? condition,
      Map<String, dynamic> data});

  $MessageTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$SimpleMessageCopyWithImpl<$Res, $Val extends SimpleMessage>
    implements $SimpleMessageCopyWith<$Res> {
  _$SimpleMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? triggers = null,
    Object? condition = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      triggers: null == triggers
          ? _value.triggers
          : triggers // ignore: cast_nullable_to_non_nullable
              as List<MessageTrigger>,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as MessageCondition?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageTypeCopyWith<$Res> get type {
    return $MessageTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SimpleMessageImplCopyWith<$Res>
    implements $SimpleMessageCopyWith<$Res> {
  factory _$$SimpleMessageImplCopyWith(
          _$SimpleMessageImpl value, $Res Function(_$SimpleMessageImpl) then) =
      __$$SimpleMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      MessageType type,
      List<MessageTrigger> triggers,
      MessageCondition? condition,
      Map<String, dynamic> data});

  @override
  $MessageTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$$SimpleMessageImplCopyWithImpl<$Res>
    extends _$SimpleMessageCopyWithImpl<$Res, _$SimpleMessageImpl>
    implements _$$SimpleMessageImplCopyWith<$Res> {
  __$$SimpleMessageImplCopyWithImpl(
      _$SimpleMessageImpl _value, $Res Function(_$SimpleMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? triggers = null,
    Object? condition = freezed,
    Object? data = null,
  }) {
    return _then(_$SimpleMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      triggers: null == triggers
          ? _value._triggers
          : triggers // ignore: cast_nullable_to_non_nullable
              as List<MessageTrigger>,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as MessageCondition?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$SimpleMessageImpl implements _SimpleMessage {
  const _$SimpleMessageImpl(
      {required this.id,
      required this.type,
      required final List<MessageTrigger> triggers,
      required this.condition,
      required final Map<String, dynamic> data})
      : _triggers = triggers,
        _data = data;

  @override
  final String id;
  @override
  final MessageType type;
  final List<MessageTrigger> _triggers;
  @override
  List<MessageTrigger> get triggers {
    if (_triggers is EqualUnmodifiableListView) return _triggers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_triggers);
  }

  @override
  final MessageCondition? condition;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'SimpleMessage(id: $id, type: $type, triggers: $triggers, condition: $condition, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._triggers, _triggers) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      const DeepCollectionEquality().hash(_triggers),
      condition,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleMessageImplCopyWith<_$SimpleMessageImpl> get copyWith =>
      __$$SimpleMessageImplCopyWithImpl<_$SimpleMessageImpl>(this, _$identity);
}

abstract class _SimpleMessage implements SimpleMessage {
  const factory _SimpleMessage(
      {required final String id,
      required final MessageType type,
      required final List<MessageTrigger> triggers,
      required final MessageCondition? condition,
      required final Map<String, dynamic> data}) = _$SimpleMessageImpl;

  @override
  String get id;
  @override
  MessageType get type;
  @override
  List<MessageTrigger> get triggers;
  @override
  MessageCondition? get condition;
  @override
  Map<String, dynamic> get data;
  @override
  @JsonKey(ignore: true)
  _$$SimpleMessageImplCopyWith<_$SimpleMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
