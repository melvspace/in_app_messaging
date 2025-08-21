// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserContext {
  String? get id;
  String? get name;
  String? get email;
  String? get phone;
  String? get language;
  Map<String, String> get extra;

  /// Create a copy of UserContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserContextCopyWith<UserContext> get copyWith =>
      _$UserContextCopyWithImpl<UserContext>(this as UserContext, _$identity);

  /// Serializes this UserContext to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserContext &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other.extra, extra));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, phone, language,
      const DeepCollectionEquality().hash(extra));

  @override
  String toString() {
    return 'UserContext(id: $id, name: $name, email: $email, phone: $phone, language: $language, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class $UserContextCopyWith<$Res> {
  factory $UserContextCopyWith(
          UserContext value, $Res Function(UserContext) _then) =
      _$UserContextCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? email,
      String? phone,
      String? language,
      Map<String, String> extra});
}

/// @nodoc
class _$UserContextCopyWithImpl<$Res> implements $UserContextCopyWith<$Res> {
  _$UserContextCopyWithImpl(this._self, this._then);

  final UserContext _self;
  final $Res Function(UserContext) _then;

  /// Create a copy of UserContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? language = freezed,
    Object? extra = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: null == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserContext].
extension UserContextPatterns on UserContext {
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
    TResult Function(_UserContext value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserContext() when $default != null:
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
    TResult Function(_UserContext value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserContext():
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
    TResult? Function(_UserContext value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserContext() when $default != null:
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
    TResult Function(String? id, String? name, String? email, String? phone,
            String? language, Map<String, String> extra)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserContext() when $default != null:
        return $default(_that.id, _that.name, _that.email, _that.phone,
            _that.language, _that.extra);
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
    TResult Function(String? id, String? name, String? email, String? phone,
            String? language, Map<String, String> extra)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserContext():
        return $default(_that.id, _that.name, _that.email, _that.phone,
            _that.language, _that.extra);
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
    TResult? Function(String? id, String? name, String? email, String? phone,
            String? language, Map<String, String> extra)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserContext() when $default != null:
        return $default(_that.id, _that.name, _that.email, _that.phone,
            _that.language, _that.extra);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserContext extends UserContext {
  const _UserContext(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.language,
      final Map<String, String> extra = const {}})
      : _extra = extra,
        super._();
  factory _UserContext.fromJson(Map<String, dynamic> json) =>
      _$UserContextFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? language;
  final Map<String, String> _extra;
  @override
  @JsonKey()
  Map<String, String> get extra {
    if (_extra is EqualUnmodifiableMapView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_extra);
  }

  /// Create a copy of UserContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserContextCopyWith<_UserContext> get copyWith =>
      __$UserContextCopyWithImpl<_UserContext>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserContextToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserContext &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other._extra, _extra));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, phone, language,
      const DeepCollectionEquality().hash(_extra));

  @override
  String toString() {
    return 'UserContext(id: $id, name: $name, email: $email, phone: $phone, language: $language, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class _$UserContextCopyWith<$Res>
    implements $UserContextCopyWith<$Res> {
  factory _$UserContextCopyWith(
          _UserContext value, $Res Function(_UserContext) _then) =
      __$UserContextCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? email,
      String? phone,
      String? language,
      Map<String, String> extra});
}

/// @nodoc
class __$UserContextCopyWithImpl<$Res> implements _$UserContextCopyWith<$Res> {
  __$UserContextCopyWithImpl(this._self, this._then);

  final _UserContext _self;
  final $Res Function(_UserContext) _then;

  /// Create a copy of UserContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? language = freezed,
    Object? extra = null,
  }) {
    return _then(_UserContext(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: null == extra
          ? _self._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

// dart format on
