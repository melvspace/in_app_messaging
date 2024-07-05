// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessageType {
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageTypeCopyWith<MessageType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageTypeCopyWith<$Res> {
  factory $MessageTypeCopyWith(
          MessageType value, $Res Function(MessageType) then) =
      _$MessageTypeCopyWithImpl<$Res, MessageType>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$MessageTypeCopyWithImpl<$Res, $Val extends MessageType>
    implements $MessageTypeCopyWith<$Res> {
  _$MessageTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageTypeImplCopyWith<$Res>
    implements $MessageTypeCopyWith<$Res> {
  factory _$$MessageTypeImplCopyWith(
          _$MessageTypeImpl value, $Res Function(_$MessageTypeImpl) then) =
      __$$MessageTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$MessageTypeImplCopyWithImpl<$Res>
    extends _$MessageTypeCopyWithImpl<$Res, _$MessageTypeImpl>
    implements _$$MessageTypeImplCopyWith<$Res> {
  __$$MessageTypeImplCopyWithImpl(
      _$MessageTypeImpl _value, $Res Function(_$MessageTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$MessageTypeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MessageTypeImpl implements _MessageType {
  const _$MessageTypeImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'MessageType(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageTypeImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageTypeImplCopyWith<_$MessageTypeImpl> get copyWith =>
      __$$MessageTypeImplCopyWithImpl<_$MessageTypeImpl>(this, _$identity);
}

abstract class _MessageType implements MessageType {
  const factory _MessageType({required final String name}) = _$MessageTypeImpl;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$MessageTypeImplCopyWith<_$MessageTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
