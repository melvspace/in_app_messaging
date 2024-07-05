// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_trigger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageTrigger _$MessageTriggerFromJson(Map<String, dynamic> json) {
  return MessageEventTrigger.fromJson(json);
}

/// @nodoc
mixin _$MessageTrigger {
  String get event => throw _privateConstructorUsedError;

  /// Optional trigger payload
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String event, Map<String, dynamic>? data) event,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String event, Map<String, dynamic>? data)? event,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String event, Map<String, dynamic>? data)? event,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageEventTrigger value) event,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageEventTrigger value)? event,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventTrigger value)? event,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageTriggerCopyWith<MessageTrigger> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageTriggerCopyWith<$Res> {
  factory $MessageTriggerCopyWith(
          MessageTrigger value, $Res Function(MessageTrigger) then) =
      _$MessageTriggerCopyWithImpl<$Res, MessageTrigger>;
  @useResult
  $Res call({String event, Map<String, dynamic>? data});
}

/// @nodoc
class _$MessageTriggerCopyWithImpl<$Res, $Val extends MessageTrigger>
    implements $MessageTriggerCopyWith<$Res> {
  _$MessageTriggerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageEventTriggerImplCopyWith<$Res>
    implements $MessageTriggerCopyWith<$Res> {
  factory _$$MessageEventTriggerImplCopyWith(_$MessageEventTriggerImpl value,
          $Res Function(_$MessageEventTriggerImpl) then) =
      __$$MessageEventTriggerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String event, Map<String, dynamic>? data});
}

/// @nodoc
class __$$MessageEventTriggerImplCopyWithImpl<$Res>
    extends _$MessageTriggerCopyWithImpl<$Res, _$MessageEventTriggerImpl>
    implements _$$MessageEventTriggerImplCopyWith<$Res> {
  __$$MessageEventTriggerImplCopyWithImpl(_$MessageEventTriggerImpl _value,
      $Res Function(_$MessageEventTriggerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? data = freezed,
  }) {
    return _then(_$MessageEventTriggerImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageEventTriggerImpl extends MessageEventTrigger {
  const _$MessageEventTriggerImpl(
      {required this.event, required final Map<String, dynamic>? data})
      : _data = data,
        super._();

  factory _$MessageEventTriggerImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageEventTriggerImplFromJson(json);

  @override
  final String event;

  /// Optional trigger payload
  final Map<String, dynamic>? _data;

  /// Optional trigger payload
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'MessageTrigger.event(event: $event, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageEventTriggerImpl &&
            (identical(other.event, event) || other.event == event) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, event, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageEventTriggerImplCopyWith<_$MessageEventTriggerImpl> get copyWith =>
      __$$MessageEventTriggerImplCopyWithImpl<_$MessageEventTriggerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String event, Map<String, dynamic>? data) event,
  }) {
    return event(this.event, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String event, Map<String, dynamic>? data)? event,
  }) {
    return event?.call(this.event, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String event, Map<String, dynamic>? data)? event,
    required TResult orElse(),
  }) {
    if (event != null) {
      return event(this.event, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageEventTrigger value) event,
  }) {
    return event(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageEventTrigger value)? event,
  }) {
    return event?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventTrigger value)? event,
    required TResult orElse(),
  }) {
    if (event != null) {
      return event(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageEventTriggerImplToJson(
      this,
    );
  }
}

abstract class MessageEventTrigger extends MessageTrigger {
  const factory MessageEventTrigger(
      {required final String event,
      required final Map<String, dynamic>? data}) = _$MessageEventTriggerImpl;
  const MessageEventTrigger._() : super._();

  factory MessageEventTrigger.fromJson(Map<String, dynamic> json) =
      _$MessageEventTriggerImpl.fromJson;

  @override
  String get event;
  @override

  /// Optional trigger payload
  Map<String, dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$MessageEventTriggerImplCopyWith<_$MessageEventTriggerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
