// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SimpleMessage {
  String get id;
  bool get enabled;
  MessageType get type; // display settings
  DateTime get start;
  DateTime? get end;
  int get priority; // triggers and conditions
  List<MessageTrigger> get triggers;
  JsonMap? get condition; // custom properties
  JsonMap get data;

  /// Create a copy of SimpleMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SimpleMessageCopyWith<SimpleMessage> get copyWith =>
      _$SimpleMessageCopyWithImpl<SimpleMessage>(
          this as SimpleMessage, _$identity);

  /// Serializes this SimpleMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SimpleMessage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other.triggers, triggers) &&
            const DeepCollectionEquality().equals(other.condition, condition) &&
            const DeepCollectionEquality().equals(other.data, data));
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
      const DeepCollectionEquality().hash(triggers),
      const DeepCollectionEquality().hash(condition),
      const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'SimpleMessage(id: $id, enabled: $enabled, type: $type, start: $start, end: $end, priority: $priority, triggers: $triggers, condition: $condition, data: $data)';
  }
}

/// @nodoc
abstract mixin class $SimpleMessageCopyWith<$Res> {
  factory $SimpleMessageCopyWith(
          SimpleMessage value, $Res Function(SimpleMessage) _then) =
      _$SimpleMessageCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      bool enabled,
      MessageType type,
      DateTime start,
      DateTime? end,
      int priority,
      List<MessageTrigger> triggers,
      JsonMap? condition,
      JsonMap data});

  $MessageTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$SimpleMessageCopyWithImpl<$Res>
    implements $SimpleMessageCopyWith<$Res> {
  _$SimpleMessageCopyWithImpl(this._self, this._then);

  final SimpleMessage _self;
  final $Res Function(SimpleMessage) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: freezed == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      triggers: null == triggers
          ? _self.triggers
          : triggers // ignore: cast_nullable_to_non_nullable
              as List<MessageTrigger>,
      condition: freezed == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as JsonMap?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as JsonMap,
    ));
  }

  /// Create a copy of SimpleMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageTypeCopyWith<$Res> get type {
    return $MessageTypeCopyWith<$Res>(_self.type, (value) {
      return _then(_self.copyWith(type: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SimpleMessage].
extension SimpleMessagePatterns on SimpleMessage {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SimpleMessage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SimpleMessage() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_SimpleMessage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SimpleMessage():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SimpleMessage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SimpleMessage() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            bool enabled,
            MessageType type,
            DateTime start,
            DateTime? end,
            int priority,
            List<MessageTrigger> triggers,
            JsonMap? condition,
            JsonMap data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SimpleMessage() when $default != null:
        return $default(
            _that.id,
            _that.enabled,
            _that.type,
            _that.start,
            _that.end,
            _that.priority,
            _that.triggers,
            _that.condition,
            _that.data);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            bool enabled,
            MessageType type,
            DateTime start,
            DateTime? end,
            int priority,
            List<MessageTrigger> triggers,
            JsonMap? condition,
            JsonMap data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SimpleMessage():
        return $default(
            _that.id,
            _that.enabled,
            _that.type,
            _that.start,
            _that.end,
            _that.priority,
            _that.triggers,
            _that.condition,
            _that.data);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            bool enabled,
            MessageType type,
            DateTime start,
            DateTime? end,
            int priority,
            List<MessageTrigger> triggers,
            JsonMap? condition,
            JsonMap data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SimpleMessage() when $default != null:
        return $default(
            _that.id,
            _that.enabled,
            _that.type,
            _that.start,
            _that.end,
            _that.priority,
            _that.triggers,
            _that.condition,
            _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SimpleMessage implements SimpleMessage {
  const _SimpleMessage(
      {required this.id,
      required this.enabled,
      required this.type,
      required this.start,
      this.end,
      this.priority = 0,
      required final List<MessageTrigger> triggers,
      final JsonMap? condition,
      required final JsonMap data})
      : _triggers = triggers,
        _condition = condition,
        _data = data;
  factory _SimpleMessage.fromJson(Map<String, dynamic> json) =>
      _$SimpleMessageFromJson(json);

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

  final JsonMap? _condition;
  @override
  JsonMap? get condition {
    final value = _condition;
    if (value == null) return null;
    if (_condition is EqualUnmodifiableMapView) return _condition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

// custom properties
  final JsonMap _data;
// custom properties
  @override
  JsonMap get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  /// Create a copy of SimpleMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SimpleMessageCopyWith<_SimpleMessage> get copyWith =>
      __$SimpleMessageCopyWithImpl<_SimpleMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SimpleMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SimpleMessage &&
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

  @override
  String toString() {
    return 'SimpleMessage(id: $id, enabled: $enabled, type: $type, start: $start, end: $end, priority: $priority, triggers: $triggers, condition: $condition, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$SimpleMessageCopyWith<$Res>
    implements $SimpleMessageCopyWith<$Res> {
  factory _$SimpleMessageCopyWith(
          _SimpleMessage value, $Res Function(_SimpleMessage) _then) =
      __$SimpleMessageCopyWithImpl;
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
      JsonMap? condition,
      JsonMap data});

  @override
  $MessageTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$SimpleMessageCopyWithImpl<$Res>
    implements _$SimpleMessageCopyWith<$Res> {
  __$SimpleMessageCopyWithImpl(this._self, this._then);

  final _SimpleMessage _self;
  final $Res Function(_SimpleMessage) _then;

  /// Create a copy of SimpleMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_SimpleMessage(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: freezed == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      triggers: null == triggers
          ? _self._triggers
          : triggers // ignore: cast_nullable_to_non_nullable
              as List<MessageTrigger>,
      condition: freezed == condition
          ? _self._condition
          : condition // ignore: cast_nullable_to_non_nullable
              as JsonMap?,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as JsonMap,
    ));
  }

  /// Create a copy of SimpleMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageTypeCopyWith<$Res> get type {
    return $MessageTypeCopyWith<$Res>(_self.type, (value) {
      return _then(_self.copyWith(type: value));
    });
  }
}

// dart format on
