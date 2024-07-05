// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_with_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessageWithContext {
  Message get message => throw _privateConstructorUsedError;
  MessageContext get context => throw _privateConstructorUsedError;
  Interact get interact => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageWithContextCopyWith<MessageWithContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageWithContextCopyWith<$Res> {
  factory $MessageWithContextCopyWith(
          MessageWithContext value, $Res Function(MessageWithContext) then) =
      _$MessageWithContextCopyWithImpl<$Res, MessageWithContext>;
  @useResult
  $Res call({Message message, MessageContext context, Interact interact});

  $MessageContextCopyWith<$Res> get context;
}

/// @nodoc
class _$MessageWithContextCopyWithImpl<$Res, $Val extends MessageWithContext>
    implements $MessageWithContextCopyWith<$Res> {
  _$MessageWithContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? context = null,
    Object? interact = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as MessageContext,
      interact: null == interact
          ? _value.interact
          : interact // ignore: cast_nullable_to_non_nullable
              as Interact,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageContextCopyWith<$Res> get context {
    return $MessageContextCopyWith<$Res>(_value.context, (value) {
      return _then(_value.copyWith(context: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageWithContextImplCopyWith<$Res>
    implements $MessageWithContextCopyWith<$Res> {
  factory _$$MessageWithContextImplCopyWith(_$MessageWithContextImpl value,
          $Res Function(_$MessageWithContextImpl) then) =
      __$$MessageWithContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Message message, MessageContext context, Interact interact});

  @override
  $MessageContextCopyWith<$Res> get context;
}

/// @nodoc
class __$$MessageWithContextImplCopyWithImpl<$Res>
    extends _$MessageWithContextCopyWithImpl<$Res, _$MessageWithContextImpl>
    implements _$$MessageWithContextImplCopyWith<$Res> {
  __$$MessageWithContextImplCopyWithImpl(_$MessageWithContextImpl _value,
      $Res Function(_$MessageWithContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? context = null,
    Object? interact = null,
  }) {
    return _then(_$MessageWithContextImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as MessageContext,
      interact: null == interact
          ? _value.interact
          : interact // ignore: cast_nullable_to_non_nullable
              as Interact,
    ));
  }
}

/// @nodoc

class _$MessageWithContextImpl implements _MessageWithContext {
  const _$MessageWithContextImpl(
      {required this.message, required this.context, required this.interact});

  @override
  final Message message;
  @override
  final MessageContext context;
  @override
  final Interact interact;

  @override
  String toString() {
    return 'MessageWithContext(message: $message, context: $context, interact: $interact)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageWithContextImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.interact, interact) ||
                other.interact == interact));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, context, interact);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageWithContextImplCopyWith<_$MessageWithContextImpl> get copyWith =>
      __$$MessageWithContextImplCopyWithImpl<_$MessageWithContextImpl>(
          this, _$identity);
}

abstract class _MessageWithContext implements MessageWithContext {
  const factory _MessageWithContext(
      {required final Message message,
      required final MessageContext context,
      required final Interact interact}) = _$MessageWithContextImpl;

  @override
  Message get message;
  @override
  MessageContext get context;
  @override
  Interact get interact;
  @override
  @JsonKey(ignore: true)
  _$$MessageWithContextImplCopyWith<_$MessageWithContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
