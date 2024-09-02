// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceContext _$DeviceContextFromJson(Map<String, dynamic> json) {
  return _DeviceContext.fromJson(json);
}

/// @nodoc
mixin _$DeviceContext {
  String get platform => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get versionNumber => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;

  /// Serializes this DeviceContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceContextCopyWith<DeviceContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceContextCopyWith<$Res> {
  factory $DeviceContextCopyWith(
          DeviceContext value, $Res Function(DeviceContext) then) =
      _$DeviceContextCopyWithImpl<$Res, DeviceContext>;
  @useResult
  $Res call(
      {String platform, String version, String versionNumber, String language});
}

/// @nodoc
class _$DeviceContextCopyWithImpl<$Res, $Val extends DeviceContext>
    implements $DeviceContextCopyWith<$Res> {
  _$DeviceContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? version = null,
    Object? versionNumber = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceContextImplCopyWith<$Res>
    implements $DeviceContextCopyWith<$Res> {
  factory _$$DeviceContextImplCopyWith(
          _$DeviceContextImpl value, $Res Function(_$DeviceContextImpl) then) =
      __$$DeviceContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String platform, String version, String versionNumber, String language});
}

/// @nodoc
class __$$DeviceContextImplCopyWithImpl<$Res>
    extends _$DeviceContextCopyWithImpl<$Res, _$DeviceContextImpl>
    implements _$$DeviceContextImplCopyWith<$Res> {
  __$$DeviceContextImplCopyWithImpl(
      _$DeviceContextImpl _value, $Res Function(_$DeviceContextImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? version = null,
    Object? versionNumber = null,
    Object? language = null,
  }) {
    return _then(_$DeviceContextImpl(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      versionNumber: null == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceContextImpl extends _DeviceContext {
  const _$DeviceContextImpl(
      {required this.platform,
      required this.version,
      required this.versionNumber,
      required this.language})
      : super._();

  factory _$DeviceContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceContextImplFromJson(json);

  @override
  final String platform;
  @override
  final String version;
  @override
  final String versionNumber;
  @override
  final String language;

  @override
  String toString() {
    return 'DeviceContext(platform: $platform, version: $version, versionNumber: $versionNumber, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceContextImpl &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, platform, version, versionNumber, language);

  /// Create a copy of DeviceContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceContextImplCopyWith<_$DeviceContextImpl> get copyWith =>
      __$$DeviceContextImplCopyWithImpl<_$DeviceContextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceContextImplToJson(
      this,
    );
  }
}

abstract class _DeviceContext extends DeviceContext {
  const factory _DeviceContext(
      {required final String platform,
      required final String version,
      required final String versionNumber,
      required final String language}) = _$DeviceContextImpl;
  const _DeviceContext._() : super._();

  factory _DeviceContext.fromJson(Map<String, dynamic> json) =
      _$DeviceContextImpl.fromJson;

  @override
  String get platform;
  @override
  String get version;
  @override
  String get versionNumber;
  @override
  String get language;

  /// Create a copy of DeviceContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceContextImplCopyWith<_$DeviceContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
