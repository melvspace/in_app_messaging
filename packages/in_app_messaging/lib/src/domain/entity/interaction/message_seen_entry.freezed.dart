// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_seen_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageSeenEntry {
  DateTime get date;
  String? get trigger;
  Map<String, dynamic>? get triggerProperties;

  /// Create a copy of MessageSeenEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageSeenEntryCopyWith<MessageSeenEntry> get copyWith =>
      _$MessageSeenEntryCopyWithImpl<MessageSeenEntry>(
          this as MessageSeenEntry, _$identity);

  /// Serializes this MessageSeenEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageSeenEntry &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            const DeepCollectionEquality()
                .equals(other.triggerProperties, triggerProperties));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, trigger,
      const DeepCollectionEquality().hash(triggerProperties));

  @override
  String toString() {
    return 'MessageSeenEntry(date: $date, trigger: $trigger, triggerProperties: $triggerProperties)';
  }
}

/// @nodoc
abstract mixin class $MessageSeenEntryCopyWith<$Res> {
  factory $MessageSeenEntryCopyWith(
          MessageSeenEntry value, $Res Function(MessageSeenEntry) _then) =
      _$MessageSeenEntryCopyWithImpl;
  @useResult
  $Res call(
      {DateTime date,
      String? trigger,
      Map<String, dynamic>? triggerProperties});
}

/// @nodoc
class _$MessageSeenEntryCopyWithImpl<$Res>
    implements $MessageSeenEntryCopyWith<$Res> {
  _$MessageSeenEntryCopyWithImpl(this._self, this._then);

  final MessageSeenEntry _self;
  final $Res Function(MessageSeenEntry) _then;

  /// Create a copy of MessageSeenEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? trigger = freezed,
    Object? triggerProperties = freezed,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      trigger: freezed == trigger
          ? _self.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as String?,
      triggerProperties: freezed == triggerProperties
          ? _self.triggerProperties
          : triggerProperties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MessageSeenEntry].
extension MessageSeenEntryPatterns on MessageSeenEntry {
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
    TResult Function(_MessageSeenEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessageSeenEntry() when $default != null:
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
    TResult Function(_MessageSeenEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageSeenEntry():
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
    TResult? Function(_MessageSeenEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageSeenEntry() when $default != null:
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
    TResult Function(DateTime date, String? trigger,
            Map<String, dynamic>? triggerProperties)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessageSeenEntry() when $default != null:
        return $default(_that.date, _that.trigger, _that.triggerProperties);
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
    TResult Function(DateTime date, String? trigger,
            Map<String, dynamic>? triggerProperties)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageSeenEntry():
        return $default(_that.date, _that.trigger, _that.triggerProperties);
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
    TResult? Function(DateTime date, String? trigger,
            Map<String, dynamic>? triggerProperties)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageSeenEntry() when $default != null:
        return $default(_that.date, _that.trigger, _that.triggerProperties);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MessageSeenEntry implements MessageSeenEntry {
  const _MessageSeenEntry(
      {required this.date,
      this.trigger,
      final Map<String, dynamic>? triggerProperties})
      : _triggerProperties = triggerProperties;
  factory _MessageSeenEntry.fromJson(Map<String, dynamic> json) =>
      _$MessageSeenEntryFromJson(json);

  @override
  final DateTime date;
  @override
  final String? trigger;
  final Map<String, dynamic>? _triggerProperties;
  @override
  Map<String, dynamic>? get triggerProperties {
    final value = _triggerProperties;
    if (value == null) return null;
    if (_triggerProperties is EqualUnmodifiableMapView)
      return _triggerProperties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of MessageSeenEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageSeenEntryCopyWith<_MessageSeenEntry> get copyWith =>
      __$MessageSeenEntryCopyWithImpl<_MessageSeenEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageSeenEntryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageSeenEntry &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            const DeepCollectionEquality()
                .equals(other._triggerProperties, _triggerProperties));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, trigger,
      const DeepCollectionEquality().hash(_triggerProperties));

  @override
  String toString() {
    return 'MessageSeenEntry(date: $date, trigger: $trigger, triggerProperties: $triggerProperties)';
  }
}

/// @nodoc
abstract mixin class _$MessageSeenEntryCopyWith<$Res>
    implements $MessageSeenEntryCopyWith<$Res> {
  factory _$MessageSeenEntryCopyWith(
          _MessageSeenEntry value, $Res Function(_MessageSeenEntry) _then) =
      __$MessageSeenEntryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime date,
      String? trigger,
      Map<String, dynamic>? triggerProperties});
}

/// @nodoc
class __$MessageSeenEntryCopyWithImpl<$Res>
    implements _$MessageSeenEntryCopyWith<$Res> {
  __$MessageSeenEntryCopyWithImpl(this._self, this._then);

  final _MessageSeenEntry _self;
  final $Res Function(_MessageSeenEntry) _then;

  /// Create a copy of MessageSeenEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? trigger = freezed,
    Object? triggerProperties = freezed,
  }) {
    return _then(_MessageSeenEntry(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      trigger: freezed == trigger
          ? _self.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as String?,
      triggerProperties: freezed == triggerProperties
          ? _self._triggerProperties
          : triggerProperties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

// dart format on
