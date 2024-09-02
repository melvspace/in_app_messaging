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

SimpleMessage _$SimpleMessageFromJson(Map<String, dynamic> json) {
  return _SimpleMessage.fromJson(json);
}

/// @nodoc
mixin _$SimpleMessage {
  String get id => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  MessageType get type =>
      throw _privateConstructorUsedError; // display settings
  DateTime get start => throw _privateConstructorUsedError;
  DateTime? get end => throw _privateConstructorUsedError;
  int get priority =>
      throw _privateConstructorUsedError; // triggers and conditions
  List<MessageTrigger> get triggers => throw _privateConstructorUsedError;
  Map<String, dynamic>? get condition =>
      throw _privateConstructorUsedError; // custom properties
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  /// Serializes this SimpleMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimpleMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      bool enabled,
      MessageType type,
      DateTime start,
      DateTime? end,
      int priority,
      List<MessageTrigger> triggers,
      Map<String, dynamic>? condition,
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

  /// Create a copy of SimpleMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? enabled = null,
    Object? type = null,
    Object? start = null,
    Object? end = freezed,
    Object? priority = null,
    Object? triggers = null,
    Object? condition = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      triggers: null == triggers
          ? _value.triggers
          : triggers // ignore: cast_nullable_to_non_nullable
              as List<MessageTrigger>,
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  /// Create a copy of SimpleMessage
  /// with the given fields replaced by the non-null parameter values.
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
      bool enabled,
      MessageType type,
      DateTime start,
      DateTime? end,
      int priority,
      List<MessageTrigger> triggers,
      Map<String, dynamic>? condition,
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

  /// Create a copy of SimpleMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? enabled = null,
    Object? type = null,
    Object? start = null,
    Object? end = freezed,
    Object? priority = null,
    Object? triggers = null,
    Object? condition = freezed,
    Object? data = null,
  }) {
    return _then(_$SimpleMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      triggers: null == triggers
          ? _value._triggers
          : triggers // ignore: cast_nullable_to_non_nullable
              as List<MessageTrigger>,
      condition: freezed == condition
          ? _value._condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleMessageImpl implements _SimpleMessage {
  const _$SimpleMessageImpl(
      {required this.id,
      required this.enabled,
      required this.type,
      required this.start,
      this.end,
      this.priority = 0,
      required final List<MessageTrigger> triggers,
      final Map<String, dynamic>? condition,
      required final Map<String, dynamic> data})
      : _triggers = triggers,
        _condition = condition,
        _data = data;

  factory _$SimpleMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleMessageImplFromJson(json);

  @override
  final String id;
  @override
  final bool enabled;
  @override
  final MessageType type;
// display settings
  @override
  final DateTime start;
  @override
  final DateTime? end;
  @override
  @JsonKey()
  final int priority;
// triggers and conditions
  final List<MessageTrigger> _triggers;
// triggers and conditions
  @override
  List<MessageTrigger> get triggers {
    if (_triggers is EqualUnmodifiableListView) return _triggers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_triggers);
  }

  final Map<String, dynamic>? _condition;
  @override
  Map<String, dynamic>? get condition {
    final value = _condition;
    if (value == null) return null;
    if (_condition is EqualUnmodifiableMapView) return _condition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

// custom properties
  final Map<String, dynamic> _data;
// custom properties
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'SimpleMessage(id: $id, enabled: $enabled, type: $type, start: $start, end: $end, priority: $priority, triggers: $triggers, condition: $condition, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other._triggers, _triggers) &&
            const DeepCollectionEquality()
                .equals(other._condition, _condition) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      enabled,
      type,
      start,
      end,
      priority,
      const DeepCollectionEquality().hash(_triggers),
      const DeepCollectionEquality().hash(_condition),
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of SimpleMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleMessageImplCopyWith<_$SimpleMessageImpl> get copyWith =>
      __$$SimpleMessageImplCopyWithImpl<_$SimpleMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleMessageImplToJson(
      this,
    );
  }
}

abstract class _SimpleMessage implements SimpleMessage {
  const factory _SimpleMessage(
      {required final String id,
      required final bool enabled,
      required final MessageType type,
      required final DateTime start,
      final DateTime? end,
      final int priority,
      required final List<MessageTrigger> triggers,
      final Map<String, dynamic>? condition,
      required final Map<String, dynamic> data}) = _$SimpleMessageImpl;

  factory _SimpleMessage.fromJson(Map<String, dynamic> json) =
      _$SimpleMessageImpl.fromJson;

  @override
  String get id;
  @override
  bool get enabled;
  @override
  MessageType get type; // display settings
  @override
  DateTime get start;
  @override
  DateTime? get end;
  @override
  int get priority; // triggers and conditions
  @override
  List<MessageTrigger> get triggers;
  @override
  Map<String, dynamic>? get condition; // custom properties
  @override
  Map<String, dynamic> get data;

  /// Create a copy of SimpleMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleMessageImplCopyWith<_$SimpleMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
