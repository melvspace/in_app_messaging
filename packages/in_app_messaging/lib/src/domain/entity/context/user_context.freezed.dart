// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserContext _$UserContextFromJson(Map<String, dynamic> json) {
  return _UserContext.fromJson(json);
}

/// @nodoc
mixin _$UserContext {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  Map<String, String> get extra => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserContextCopyWith<UserContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserContextCopyWith<$Res> {
  factory $UserContextCopyWith(
          UserContext value, $Res Function(UserContext) then) =
      _$UserContextCopyWithImpl<$Res, UserContext>;
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
class _$UserContextCopyWithImpl<$Res, $Val extends UserContext>
    implements $UserContextCopyWith<$Res> {
  _$UserContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserContextImplCopyWith<$Res>
    implements $UserContextCopyWith<$Res> {
  factory _$$UserContextImplCopyWith(
          _$UserContextImpl value, $Res Function(_$UserContextImpl) then) =
      __$$UserContextImplCopyWithImpl<$Res>;
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
class __$$UserContextImplCopyWithImpl<$Res>
    extends _$UserContextCopyWithImpl<$Res, _$UserContextImpl>
    implements _$$UserContextImplCopyWith<$Res> {
  __$$UserContextImplCopyWithImpl(
      _$UserContextImpl _value, $Res Function(_$UserContextImpl) _then)
      : super(_value, _then);

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
    return _then(_$UserContextImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: null == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserContextImpl extends _UserContext {
  const _$UserContextImpl(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.language,
      final Map<String, String> extra = const {}})
      : _extra = extra,
        super._();

  factory _$UserContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserContextImplFromJson(json);

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

  @override
  String toString() {
    return 'UserContext(id: $id, name: $name, email: $email, phone: $phone, language: $language, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserContextImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other._extra, _extra));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, phone, language,
      const DeepCollectionEquality().hash(_extra));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserContextImplCopyWith<_$UserContextImpl> get copyWith =>
      __$$UserContextImplCopyWithImpl<_$UserContextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserContextImplToJson(
      this,
    );
  }
}

abstract class _UserContext extends UserContext {
  const factory _UserContext(
      {final String? id,
      final String? name,
      final String? email,
      final String? phone,
      final String? language,
      final Map<String, String> extra}) = _$UserContextImpl;
  const _UserContext._() : super._();

  factory _UserContext.fromJson(Map<String, dynamic> json) =
      _$UserContextImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get language;
  @override
  Map<String, String> get extra;
  @override
  @JsonKey(ignore: true)
  _$$UserContextImplCopyWith<_$UserContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
