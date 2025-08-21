// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageSlot {
  String get id;

  /// Create a copy of MessageSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageSlotCopyWith<MessageSlot> get copyWith =>
      _$MessageSlotCopyWithImpl<MessageSlot>(this as MessageSlot, _$identity);

  /// Serializes this MessageSlot to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageSlot &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'MessageSlot(id: $id)';
  }
}

/// @nodoc
abstract mixin class $MessageSlotCopyWith<$Res> {
  factory $MessageSlotCopyWith(
          MessageSlot value, $Res Function(MessageSlot) _then) =
      _$MessageSlotCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$MessageSlotCopyWithImpl<$Res> implements $MessageSlotCopyWith<$Res> {
  _$MessageSlotCopyWithImpl(this._self, this._then);

  final MessageSlot _self;
  final $Res Function(MessageSlot) _then;

  /// Create a copy of MessageSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [MessageSlot].
extension MessageSlotPatterns on MessageSlot {
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
    TResult Function(_MessageSlot value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessageSlot() when $default != null:
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
    TResult Function(_MessageSlot value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageSlot():
        return $default(_that);
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
    TResult? Function(_MessageSlot value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageSlot() when $default != null:
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
    TResult Function(String id)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessageSlot() when $default != null:
        return $default(_that.id);
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
    TResult Function(String id) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageSlot():
        return $default(_that.id);
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
    TResult? Function(String id)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageSlot() when $default != null:
        return $default(_that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MessageSlot implements MessageSlot {
  const _MessageSlot({required this.id});
  factory _MessageSlot.fromJson(Map<String, dynamic> json) =>
      _$MessageSlotFromJson(json);

  @override
  final String id;

  /// Create a copy of MessageSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageSlotCopyWith<_MessageSlot> get copyWith =>
      __$MessageSlotCopyWithImpl<_MessageSlot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageSlotToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageSlot &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'MessageSlot(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$MessageSlotCopyWith<$Res>
    implements $MessageSlotCopyWith<$Res> {
  factory _$MessageSlotCopyWith(
          _MessageSlot value, $Res Function(_MessageSlot) _then) =
      __$MessageSlotCopyWithImpl;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$MessageSlotCopyWithImpl<$Res> implements _$MessageSlotCopyWith<$Res> {
  __$MessageSlotCopyWithImpl(this._self, this._then);

  final _MessageSlot _self;
  final $Res Function(_MessageSlot) _then;

  /// Create a copy of MessageSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_MessageSlot(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
