// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_trigger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
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
  /// Serializes this MessageTrigger to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MessageTrigger);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MessageTrigger()';
  }
}

/// @nodoc
class $MessageTriggerCopyWith<$Res> {
  $MessageTriggerCopyWith(MessageTrigger _, $Res Function(MessageTrigger) __);
}

/// Adds pattern-matching-related methods to [MessageTrigger].
extension MessageTriggerPatterns on MessageTrigger {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageCronTrigger value)? cron,
    TResult Function(MessageEventTrigger value)? event,
    TResult Function(MessageEventSequenceTrigger value)? eventSequence,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case MessageCronTrigger() when cron != null:
        return cron(_that);
      case MessageEventTrigger() when event != null:
        return event(_that);
      case MessageEventSequenceTrigger() when eventSequence != null:
        return eventSequence(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageCronTrigger value) cron,
    required TResult Function(MessageEventTrigger value) event,
    required TResult Function(MessageEventSequenceTrigger value) eventSequence,
  }) {
    final _that = this;
    switch (_that) {
      case MessageCronTrigger():
        return cron(_that);
      case MessageEventTrigger():
        return event(_that);
      case MessageEventSequenceTrigger():
        return eventSequence(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageCronTrigger value)? cron,
    TResult? Function(MessageEventTrigger value)? event,
    TResult? Function(MessageEventSequenceTrigger value)? eventSequence,
  }) {
    final _that = this;
    switch (_that) {
      case MessageCronTrigger() when cron != null:
        return cron(_that);
      case MessageEventTrigger() when event != null:
        return event(_that);
      case MessageEventSequenceTrigger() when eventSequence != null:
        return eventSequence(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cron, String? event)? cron,
    TResult Function(String event, Map<String, dynamic>? data)? event,
    TResult Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)?
        eventSequence,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case MessageCronTrigger() when cron != null:
        return cron(_that.cron, _that.event);
      case MessageEventTrigger() when event != null:
        return event(_that.event, _that.data);
      case MessageEventSequenceTrigger() when eventSequence != null:
        return eventSequence(_that.events, _that.data);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cron, String? event) cron,
    required TResult Function(String event, Map<String, dynamic>? data) event,
    required TResult Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)
        eventSequence,
  }) {
    final _that = this;
    switch (_that) {
      case MessageCronTrigger():
        return cron(_that.cron, _that.event);
      case MessageEventTrigger():
        return event(_that.event, _that.data);
      case MessageEventSequenceTrigger():
        return eventSequence(_that.events, _that.data);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cron, String? event)? cron,
    TResult? Function(String event, Map<String, dynamic>? data)? event,
    TResult? Function(
            List<EventSequenceItem> events, List<Map<String, dynamic>?> data)?
        eventSequence,
  }) {
    final _that = this;
    switch (_that) {
      case MessageCronTrigger() when cron != null:
        return cron(_that.cron, _that.event);
      case MessageEventTrigger() when event != null:
        return event(_that.event, _that.data);
      case MessageEventSequenceTrigger() when eventSequence != null:
        return eventSequence(_that.events, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
@experimental
class MessageCronTrigger extends MessageTrigger {
  const MessageCronTrigger(
      {required this.cron, this.event, final String? $type})
      : $type = $type ?? 'cron',
        super._();
  factory MessageCronTrigger.fromJson(Map<String, dynamic> json) =>
      _$MessageCronTriggerFromJson(json);

  final String cron;

  /// Event triggered when cron schedule activated
  ///
  /// By default message will be triggered when cron activated
  ///
  /// If event provided then event will be sent. Can be used for event sequences.
  final String? event;

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of MessageTrigger
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageCronTriggerCopyWith<MessageCronTrigger> get copyWith =>
      _$MessageCronTriggerCopyWithImpl<MessageCronTrigger>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageCronTriggerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageCronTrigger &&
            (identical(other.cron, cron) || other.cron == cron) &&
            (identical(other.event, event) || other.event == event));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cron, event);

  @override
  String toString() {
    return 'MessageTrigger.cron(cron: $cron, event: $event)';
  }
}

/// @nodoc
abstract mixin class $MessageCronTriggerCopyWith<$Res>
    implements $MessageTriggerCopyWith<$Res> {
  factory $MessageCronTriggerCopyWith(
          MessageCronTrigger value, $Res Function(MessageCronTrigger) _then) =
      _$MessageCronTriggerCopyWithImpl;
  @useResult
  $Res call({String cron, String? event});
}

/// @nodoc
class _$MessageCronTriggerCopyWithImpl<$Res>
    implements $MessageCronTriggerCopyWith<$Res> {
  _$MessageCronTriggerCopyWithImpl(this._self, this._then);

  final MessageCronTrigger _self;
  final $Res Function(MessageCronTrigger) _then;

  /// Create a copy of MessageTrigger
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cron = null,
    Object? event = freezed,
  }) {
    return _then(MessageCronTrigger(
      cron: null == cron
          ? _self.cron
          : cron // ignore: cast_nullable_to_non_nullable
              as String,
      event: freezed == event
          ? _self.event
          : event // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class MessageEventTrigger extends MessageTrigger {
  const MessageEventTrigger(
      {required this.event,
      final Map<String, dynamic>? data = const {},
      final String? $type})
      : _data = data,
        $type = $type ?? 'event',
        super._();
  factory MessageEventTrigger.fromJson(Map<String, dynamic> json) =>
      _$MessageEventTriggerFromJson(json);

  final String event;

  /// Optional trigger payload
  final Map<String, dynamic>? _data;

  /// Optional trigger payload
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

  /// Create a copy of MessageTrigger
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageEventTriggerCopyWith<MessageEventTrigger> get copyWith =>
      _$MessageEventTriggerCopyWithImpl<MessageEventTrigger>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageEventTriggerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageEventTrigger &&
            (identical(other.event, event) || other.event == event) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, event, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'MessageTrigger.event(event: $event, data: $data)';
  }
}

/// @nodoc
abstract mixin class $MessageEventTriggerCopyWith<$Res>
    implements $MessageTriggerCopyWith<$Res> {
  factory $MessageEventTriggerCopyWith(
          MessageEventTrigger value, $Res Function(MessageEventTrigger) _then) =
      _$MessageEventTriggerCopyWithImpl;
  @useResult
  $Res call({String event, Map<String, dynamic>? data});
}

/// @nodoc
class _$MessageEventTriggerCopyWithImpl<$Res>
    implements $MessageEventTriggerCopyWith<$Res> {
  _$MessageEventTriggerCopyWithImpl(this._self, this._then);

  final MessageEventTrigger _self;
  final $Res Function(MessageEventTrigger) _then;

  /// Create a copy of MessageTrigger
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? event = null,
    Object? data = freezed,
  }) {
    return _then(MessageEventTrigger(
      event: null == event
          ? _self.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@experimental
class MessageEventSequenceTrigger extends MessageTrigger {
  const MessageEventSequenceTrigger(
      {required final List<EventSequenceItem> events,
      required final List<Map<String, dynamic>?> data,
      final String? $type})
      : _events = events,
        _data = data,
        $type = $type ?? 'eventSequence',
        super._();
  factory MessageEventSequenceTrigger.fromJson(Map<String, dynamic> json) =>
      _$MessageEventSequenceTriggerFromJson(json);

  final List<EventSequenceItem> _events;
  List<EventSequenceItem> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  /// Optional trigger payload
  final List<Map<String, dynamic>?> _data;

  /// Optional trigger payload
  List<Map<String, dynamic>?> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of MessageTrigger
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageEventSequenceTriggerCopyWith<MessageEventSequenceTrigger>
      get copyWith => _$MessageEventSequenceTriggerCopyWithImpl<
          MessageEventSequenceTrigger>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageEventSequenceTriggerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageEventSequenceTrigger &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'MessageTrigger.eventSequence(events: $events, data: $data)';
  }
}

/// @nodoc
abstract mixin class $MessageEventSequenceTriggerCopyWith<$Res>
    implements $MessageTriggerCopyWith<$Res> {
  factory $MessageEventSequenceTriggerCopyWith(
          MessageEventSequenceTrigger value,
          $Res Function(MessageEventSequenceTrigger) _then) =
      _$MessageEventSequenceTriggerCopyWithImpl;
  @useResult
  $Res call({List<EventSequenceItem> events, List<Map<String, dynamic>?> data});
}

/// @nodoc
class _$MessageEventSequenceTriggerCopyWithImpl<$Res>
    implements $MessageEventSequenceTriggerCopyWith<$Res> {
  _$MessageEventSequenceTriggerCopyWithImpl(this._self, this._then);

  final MessageEventSequenceTrigger _self;
  final $Res Function(MessageEventSequenceTrigger) _then;

  /// Create a copy of MessageTrigger
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? events = null,
    Object? data = null,
  }) {
    return _then(MessageEventSequenceTrigger(
      events: null == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventSequenceItem>,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>?>,
    ));
  }
}

// dart format on
