// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_sequence_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventSequenceItem {
  String get name;

  /// Indicates that the event is expected in the sequence
  ///
  /// If value is false and event occured as trigger it elimates any existing pending sequence.
  ///
  /// Example:
  ///   - `exam_completed, exam_closed, !diploma_form_opened(for 2 seconds)`
  ///   - if `diploma_form_opened` occured in 2 seconds after `exam_closed` whole sequence is dropped
  bool get expected;

  /// Maximum delay since previous event in seconds
  ///
  /// By default checked against infinite delay
  double? get maxDelay;

  /// Create a copy of EventSequenceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EventSequenceItemCopyWith<EventSequenceItem> get copyWith =>
      _$EventSequenceItemCopyWithImpl<EventSequenceItem>(
          this as EventSequenceItem, _$identity);

  /// Serializes this EventSequenceItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventSequenceItem &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.expected, expected) ||
                other.expected == expected) &&
            (identical(other.maxDelay, maxDelay) ||
                other.maxDelay == maxDelay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, expected, maxDelay);

  @override
  String toString() {
    return 'EventSequenceItem(name: $name, expected: $expected, maxDelay: $maxDelay)';
  }
}

/// @nodoc
abstract mixin class $EventSequenceItemCopyWith<$Res> {
  factory $EventSequenceItemCopyWith(
          EventSequenceItem value, $Res Function(EventSequenceItem) _then) =
      _$EventSequenceItemCopyWithImpl;
  @useResult
  $Res call({String name, bool expected, double? maxDelay});
}

/// @nodoc
class _$EventSequenceItemCopyWithImpl<$Res>
    implements $EventSequenceItemCopyWith<$Res> {
  _$EventSequenceItemCopyWithImpl(this._self, this._then);

  final EventSequenceItem _self;
  final $Res Function(EventSequenceItem) _then;

  /// Create a copy of EventSequenceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? expected = null,
    Object? maxDelay = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      expected: null == expected
          ? _self.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as bool,
      maxDelay: freezed == maxDelay
          ? _self.maxDelay
          : maxDelay // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [EventSequenceItem].
extension EventSequenceItemPatterns on EventSequenceItem {
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
    TResult Function(_EventSequenceItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EventSequenceItem() when $default != null:
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
    TResult Function(_EventSequenceItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventSequenceItem():
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
    TResult? Function(_EventSequenceItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventSequenceItem() when $default != null:
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
    TResult Function(String name, bool expected, double? maxDelay)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EventSequenceItem() when $default != null:
        return $default(_that.name, _that.expected, _that.maxDelay);
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
    TResult Function(String name, bool expected, double? maxDelay) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventSequenceItem():
        return $default(_that.name, _that.expected, _that.maxDelay);
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
    TResult? Function(String name, bool expected, double? maxDelay)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventSequenceItem() when $default != null:
        return $default(_that.name, _that.expected, _that.maxDelay);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EventSequenceItem implements EventSequenceItem {
  const _EventSequenceItem(
      {required this.name, this.expected = true, this.maxDelay});
  factory _EventSequenceItem.fromJson(Map<String, dynamic> json) =>
      _$EventSequenceItemFromJson(json);

  @override
  final String name;

  /// Indicates that the event is expected in the sequence
  ///
  /// If value is false and event occured as trigger it elimates any existing pending sequence.
  ///
  /// Example:
  ///   - `exam_completed, exam_closed, !diploma_form_opened(for 2 seconds)`
  ///   - if `diploma_form_opened` occured in 2 seconds after `exam_closed` whole sequence is dropped
  @override
  @JsonKey()
  final bool expected;

  /// Maximum delay since previous event in seconds
  ///
  /// By default checked against infinite delay
  @override
  final double? maxDelay;

  /// Create a copy of EventSequenceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventSequenceItemCopyWith<_EventSequenceItem> get copyWith =>
      __$EventSequenceItemCopyWithImpl<_EventSequenceItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EventSequenceItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventSequenceItem &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.expected, expected) ||
                other.expected == expected) &&
            (identical(other.maxDelay, maxDelay) ||
                other.maxDelay == maxDelay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, expected, maxDelay);

  @override
  String toString() {
    return 'EventSequenceItem(name: $name, expected: $expected, maxDelay: $maxDelay)';
  }
}

/// @nodoc
abstract mixin class _$EventSequenceItemCopyWith<$Res>
    implements $EventSequenceItemCopyWith<$Res> {
  factory _$EventSequenceItemCopyWith(
          _EventSequenceItem value, $Res Function(_EventSequenceItem) _then) =
      __$EventSequenceItemCopyWithImpl;
  @override
  @useResult
  $Res call({String name, bool expected, double? maxDelay});
}

/// @nodoc
class __$EventSequenceItemCopyWithImpl<$Res>
    implements _$EventSequenceItemCopyWith<$Res> {
  __$EventSequenceItemCopyWithImpl(this._self, this._then);

  final _EventSequenceItem _self;
  final $Res Function(_EventSequenceItem) _then;

  /// Create a copy of EventSequenceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? expected = null,
    Object? maxDelay = freezed,
  }) {
    return _then(_EventSequenceItem(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      expected: null == expected
          ? _self.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as bool,
      maxDelay: freezed == maxDelay
          ? _self.maxDelay
          : maxDelay // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
