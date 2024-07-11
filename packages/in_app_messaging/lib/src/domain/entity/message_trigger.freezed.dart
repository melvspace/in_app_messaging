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
  switch (json['type']) {
    case 'cron':
      return MessageCronTrigger.fromJson(json);
    case 'event':
      return MessageEventTrigger.fromJson(json);
    case 'eventSequence':
      return MessageEventSequenceTrigger.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'MessageTrigger',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$MessageTrigger {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cron, String? event) cron,
    required TResult Function(String event, Map<String, dynamic>? data) event,
    required TResult Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)
        eventSequence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cron, String? event)? cron,
    TResult? Function(String event, Map<String, dynamic>? data)? event,
    TResult? Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)?
        eventSequence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cron, String? event)? cron,
    TResult Function(String event, Map<String, dynamic>? data)? event,
    TResult Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)?
        eventSequence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageCronTrigger value) cron,
    required TResult Function(MessageEventTrigger value) event,
    required TResult Function(MessageEventSequenceTrigger value) eventSequence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageCronTrigger value)? cron,
    TResult? Function(MessageEventTrigger value)? event,
    TResult? Function(MessageEventSequenceTrigger value)? eventSequence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageCronTrigger value)? cron,
    TResult Function(MessageEventTrigger value)? event,
    TResult Function(MessageEventSequenceTrigger value)? eventSequence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageTriggerCopyWith<$Res> {
  factory $MessageTriggerCopyWith(
          MessageTrigger value, $Res Function(MessageTrigger) then) =
      _$MessageTriggerCopyWithImpl<$Res, MessageTrigger>;
}

/// @nodoc
class _$MessageTriggerCopyWithImpl<$Res, $Val extends MessageTrigger>
    implements $MessageTriggerCopyWith<$Res> {
  _$MessageTriggerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MessageCronTriggerImplCopyWith<$Res> {
  factory _$$MessageCronTriggerImplCopyWith(_$MessageCronTriggerImpl value,
          $Res Function(_$MessageCronTriggerImpl) then) =
      __$$MessageCronTriggerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cron, String? event});
}

/// @nodoc
class __$$MessageCronTriggerImplCopyWithImpl<$Res>
    extends _$MessageTriggerCopyWithImpl<$Res, _$MessageCronTriggerImpl>
    implements _$$MessageCronTriggerImplCopyWith<$Res> {
  __$$MessageCronTriggerImplCopyWithImpl(_$MessageCronTriggerImpl _value,
      $Res Function(_$MessageCronTriggerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cron = null,
    Object? event = freezed,
  }) {
    return _then(_$MessageCronTriggerImpl(
      cron: null == cron
          ? _value.cron
          : cron // ignore: cast_nullable_to_non_nullable
              as String,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@experimental
class _$MessageCronTriggerImpl extends MessageCronTrigger {
  const _$MessageCronTriggerImpl(
      {required this.cron, this.event, final String? $type})
      : $type = $type ?? 'cron',
        super._();

  factory _$MessageCronTriggerImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageCronTriggerImplFromJson(json);

  @override
  final String cron;

  /// Event triggered when cron schedule activated
  ///
  /// By default message will be triggered when cron activated
  ///
  /// If event provided then event will be sent. Can be used for event sequences.
  @override
  final String? event;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'MessageTrigger.cron(cron: $cron, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageCronTriggerImpl &&
            (identical(other.cron, cron) || other.cron == cron) &&
            (identical(other.event, event) || other.event == event));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cron, event);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageCronTriggerImplCopyWith<_$MessageCronTriggerImpl> get copyWith =>
      __$$MessageCronTriggerImplCopyWithImpl<_$MessageCronTriggerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cron, String? event) cron,
    required TResult Function(String event, Map<String, dynamic>? data) event,
    required TResult Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)
        eventSequence,
  }) {
    return cron(this.cron, this.event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cron, String? event)? cron,
    TResult? Function(String event, Map<String, dynamic>? data)? event,
    TResult? Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)?
        eventSequence,
  }) {
    return cron?.call(this.cron, this.event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cron, String? event)? cron,
    TResult Function(String event, Map<String, dynamic>? data)? event,
    TResult Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)?
        eventSequence,
    required TResult orElse(),
  }) {
    if (cron != null) {
      return cron(this.cron, this.event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageCronTrigger value) cron,
    required TResult Function(MessageEventTrigger value) event,
    required TResult Function(MessageEventSequenceTrigger value) eventSequence,
  }) {
    return cron(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageCronTrigger value)? cron,
    TResult? Function(MessageEventTrigger value)? event,
    TResult? Function(MessageEventSequenceTrigger value)? eventSequence,
  }) {
    return cron?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageCronTrigger value)? cron,
    TResult Function(MessageEventTrigger value)? event,
    TResult Function(MessageEventSequenceTrigger value)? eventSequence,
    required TResult orElse(),
  }) {
    if (cron != null) {
      return cron(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageCronTriggerImplToJson(
      this,
    );
  }
}

abstract class MessageCronTrigger extends MessageTrigger {
  const factory MessageCronTrigger(
      {required final String cron,
      final String? event}) = _$MessageCronTriggerImpl;
  const MessageCronTrigger._() : super._();

  factory MessageCronTrigger.fromJson(Map<String, dynamic> json) =
      _$MessageCronTriggerImpl.fromJson;

  String get cron;

  /// Event triggered when cron schedule activated
  ///
  /// By default message will be triggered when cron activated
  ///
  /// If event provided then event will be sent. Can be used for event sequences.
  String? get event;
  @JsonKey(ignore: true)
  _$$MessageCronTriggerImplCopyWith<_$MessageCronTriggerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageEventTriggerImplCopyWith<$Res> {
  factory _$$MessageEventTriggerImplCopyWith(_$MessageEventTriggerImpl value,
          $Res Function(_$MessageEventTriggerImpl) then) =
      __$$MessageEventTriggerImplCopyWithImpl<$Res>;
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
      {required this.event,
      final Map<String, dynamic>? data = const {},
      final String? $type})
      : _data = data,
        $type = $type ?? 'event',
        super._();

  factory _$MessageEventTriggerImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageEventTriggerImplFromJson(json);

  @override
  final String event;

  /// Optional trigger payload
  final Map<String, dynamic>? _data;

  /// Optional trigger payload
  @override
  @JsonKey()
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @JsonKey(name: 'type')
  final String $type;

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
    required TResult Function(String cron, String? event) cron,
    required TResult Function(String event, Map<String, dynamic>? data) event,
    required TResult Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)
        eventSequence,
  }) {
    return event(this.event, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cron, String? event)? cron,
    TResult? Function(String event, Map<String, dynamic>? data)? event,
    TResult? Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)?
        eventSequence,
  }) {
    return event?.call(this.event, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cron, String? event)? cron,
    TResult Function(String event, Map<String, dynamic>? data)? event,
    TResult Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)?
        eventSequence,
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
    required TResult Function(MessageCronTrigger value) cron,
    required TResult Function(MessageEventTrigger value) event,
    required TResult Function(MessageEventSequenceTrigger value) eventSequence,
  }) {
    return event(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageCronTrigger value)? cron,
    TResult? Function(MessageEventTrigger value)? event,
    TResult? Function(MessageEventSequenceTrigger value)? eventSequence,
  }) {
    return event?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageCronTrigger value)? cron,
    TResult Function(MessageEventTrigger value)? event,
    TResult Function(MessageEventSequenceTrigger value)? eventSequence,
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
      final Map<String, dynamic>? data}) = _$MessageEventTriggerImpl;
  const MessageEventTrigger._() : super._();

  factory MessageEventTrigger.fromJson(Map<String, dynamic> json) =
      _$MessageEventTriggerImpl.fromJson;

  String get event;

  /// Optional trigger payload
  Map<String, dynamic>? get data;
  @JsonKey(ignore: true)
  _$$MessageEventTriggerImplCopyWith<_$MessageEventTriggerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageEventSequenceTriggerImplCopyWith<$Res> {
  factory _$$MessageEventSequenceTriggerImplCopyWith(
          _$MessageEventSequenceTriggerImpl value,
          $Res Function(_$MessageEventSequenceTriggerImpl) then) =
      __$$MessageEventSequenceTriggerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<EventSequenceItem> events, List<Map<String, dynamic>?> data});
}

/// @nodoc
class __$$MessageEventSequenceTriggerImplCopyWithImpl<$Res>
    extends _$MessageTriggerCopyWithImpl<$Res,
        _$MessageEventSequenceTriggerImpl>
    implements _$$MessageEventSequenceTriggerImplCopyWith<$Res> {
  __$$MessageEventSequenceTriggerImplCopyWithImpl(
      _$MessageEventSequenceTriggerImpl _value,
      $Res Function(_$MessageEventSequenceTriggerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? data = null,
  }) {
    return _then(_$MessageEventSequenceTriggerImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventSequenceItem>,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@experimental
class _$MessageEventSequenceTriggerImpl extends MessageEventSequenceTrigger {
  const _$MessageEventSequenceTriggerImpl(
      {required final List<EventSequenceItem> events,
      required final List<Map<String, dynamic>?> data,
      final String? $type})
      : _events = events,
        _data = data,
        $type = $type ?? 'eventSequence',
        super._();

  factory _$MessageEventSequenceTriggerImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MessageEventSequenceTriggerImplFromJson(json);

  final List<EventSequenceItem> _events;
  @override
  List<EventSequenceItem> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  /// Optional trigger payload
  final List<Map<String, dynamic>?> _data;

  /// Optional trigger payload
  @override
  List<Map<String, dynamic>?> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'MessageTrigger.eventSequence(events: $events, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageEventSequenceTriggerImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageEventSequenceTriggerImplCopyWith<_$MessageEventSequenceTriggerImpl>
      get copyWith => __$$MessageEventSequenceTriggerImplCopyWithImpl<
          _$MessageEventSequenceTriggerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cron, String? event) cron,
    required TResult Function(String event, Map<String, dynamic>? data) event,
    required TResult Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)
        eventSequence,
  }) {
    return eventSequence(events, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cron, String? event)? cron,
    TResult? Function(String event, Map<String, dynamic>? data)? event,
    TResult? Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)?
        eventSequence,
  }) {
    return eventSequence?.call(events, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cron, String? event)? cron,
    TResult Function(String event, Map<String, dynamic>? data)? event,
    TResult Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)?
        eventSequence,
    required TResult orElse(),
  }) {
    if (eventSequence != null) {
      return eventSequence(events, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageCronTrigger value) cron,
    required TResult Function(MessageEventTrigger value) event,
    required TResult Function(MessageEventSequenceTrigger value) eventSequence,
  }) {
    return eventSequence(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageCronTrigger value)? cron,
    TResult? Function(MessageEventTrigger value)? event,
    TResult? Function(MessageEventSequenceTrigger value)? eventSequence,
  }) {
    return eventSequence?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageCronTrigger value)? cron,
    TResult Function(MessageEventTrigger value)? event,
    TResult Function(MessageEventSequenceTrigger value)? eventSequence,
    required TResult orElse(),
  }) {
    if (eventSequence != null) {
      return eventSequence(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageEventSequenceTriggerImplToJson(
      this,
    );
  }
}

abstract class MessageEventSequenceTrigger extends MessageTrigger {
  const factory MessageEventSequenceTrigger(
          {required final List<EventSequenceItem> events,
          required final List<Map<String, dynamic>?> data}) =
      _$MessageEventSequenceTriggerImpl;
  const MessageEventSequenceTrigger._() : super._();

  factory MessageEventSequenceTrigger.fromJson(Map<String, dynamic> json) =
      _$MessageEventSequenceTriggerImpl.fromJson;

  List<EventSequenceItem> get events;

  /// Optional trigger payload
  List<Map<String, dynamic>?> get data;
  @JsonKey(ignore: true)
  _$$MessageEventSequenceTriggerImplCopyWith<_$MessageEventSequenceTriggerImpl>
      get copyWith => throw _privateConstructorUsedError;
}
