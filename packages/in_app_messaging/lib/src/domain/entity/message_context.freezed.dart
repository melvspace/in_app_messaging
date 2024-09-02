// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessageContext {
  DynamicMessage get message => throw _privateConstructorUsedError;

  /// For Trigger conditions
  MessageTrigger get trigger => throw _privateConstructorUsedError;

  /// For Interactions conditions
  MessageInteractions get interactions => throw _privateConstructorUsedError;

  /// For Interactions conditions
  Map<String, dynamic> get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DynamicMessage message, MessageTrigger trigger,
            MessageInteractions interactions, Map<String, dynamic> context)
        dynamic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DynamicMessage message, MessageTrigger trigger,
            MessageInteractions interactions, Map<String, dynamic> context)?
        dynamic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DynamicMessage message, MessageTrigger trigger,
            MessageInteractions interactions, Map<String, dynamic> context)?
        dynamic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DynamicMessageContext value) dynamic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DynamicMessageContext value)? dynamic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DynamicMessageContext value)? dynamic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageContextCopyWith<MessageContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageContextCopyWith<$Res> {
  factory $MessageContextCopyWith(
          MessageContext value, $Res Function(MessageContext) then) =
      _$MessageContextCopyWithImpl<$Res, MessageContext>;
  @useResult
  $Res call(
      {DynamicMessage message,
      MessageTrigger trigger,
      MessageInteractions interactions,
      Map<String, dynamic> context});

  $MessageTriggerCopyWith<$Res> get trigger;
  $MessageInteractionsCopyWith<$Res> get interactions;
}

/// @nodoc
class _$MessageContextCopyWithImpl<$Res, $Val extends MessageContext>
    implements $MessageContextCopyWith<$Res> {
  _$MessageContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? trigger = null,
    Object? interactions = null,
    Object? context = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as DynamicMessage,
      trigger: null == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as MessageTrigger,
      interactions: null == interactions
          ? _value.interactions
          : interactions // ignore: cast_nullable_to_non_nullable
              as MessageInteractions,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageTriggerCopyWith<$Res> get trigger {
    return $MessageTriggerCopyWith<$Res>(_value.trigger, (value) {
      return _then(_value.copyWith(trigger: value) as $Val);
    });
  }

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageInteractionsCopyWith<$Res> get interactions {
    return $MessageInteractionsCopyWith<$Res>(_value.interactions, (value) {
      return _then(_value.copyWith(interactions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DynamicMessageContextImplCopyWith<$Res>
    implements $MessageContextCopyWith<$Res> {
  factory _$$DynamicMessageContextImplCopyWith(
          _$DynamicMessageContextImpl value,
          $Res Function(_$DynamicMessageContextImpl) then) =
      __$$DynamicMessageContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DynamicMessage message,
      MessageTrigger trigger,
      MessageInteractions interactions,
      Map<String, dynamic> context});

  @override
  $MessageTriggerCopyWith<$Res> get trigger;
  @override
  $MessageInteractionsCopyWith<$Res> get interactions;
}

/// @nodoc
class __$$DynamicMessageContextImplCopyWithImpl<$Res>
    extends _$MessageContextCopyWithImpl<$Res, _$DynamicMessageContextImpl>
    implements _$$DynamicMessageContextImplCopyWith<$Res> {
  __$$DynamicMessageContextImplCopyWithImpl(_$DynamicMessageContextImpl _value,
      $Res Function(_$DynamicMessageContextImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? trigger = null,
    Object? interactions = null,
    Object? context = null,
  }) {
    return _then(_$DynamicMessageContextImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as DynamicMessage,
      trigger: null == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as MessageTrigger,
      interactions: null == interactions
          ? _value.interactions
          : interactions // ignore: cast_nullable_to_non_nullable
              as MessageInteractions,
      context: null == context
          ? _value._context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$DynamicMessageContextImpl extends DynamicMessageContext {
  const _$DynamicMessageContextImpl(
      {required this.message,
      required this.trigger,
      required this.interactions,
      required final Map<String, dynamic> context})
      : _context = context,
        super._();

  @override
  final DynamicMessage message;

  /// For Trigger conditions
  @override
  final MessageTrigger trigger;

  /// For Interactions conditions
  @override
  final MessageInteractions interactions;

  /// For Interactions conditions
  final Map<String, dynamic> _context;

  /// For Interactions conditions
  @override
  Map<String, dynamic> get context {
    if (_context is EqualUnmodifiableMapView) return _context;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_context);
  }

  @override
  String toString() {
    return 'MessageContext.dynamic(message: $message, trigger: $trigger, interactions: $interactions, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DynamicMessageContextImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            (identical(other.interactions, interactions) ||
                other.interactions == interactions) &&
            const DeepCollectionEquality().equals(other._context, _context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, trigger, interactions,
      const DeepCollectionEquality().hash(_context));

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DynamicMessageContextImplCopyWith<_$DynamicMessageContextImpl>
      get copyWith => __$$DynamicMessageContextImplCopyWithImpl<
          _$DynamicMessageContextImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DynamicMessage message, MessageTrigger trigger,
            MessageInteractions interactions, Map<String, dynamic> context)
        dynamic,
  }) {
    return dynamic(message, trigger, interactions, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DynamicMessage message, MessageTrigger trigger,
            MessageInteractions interactions, Map<String, dynamic> context)?
        dynamic,
  }) {
    return dynamic?.call(message, trigger, interactions, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DynamicMessage message, MessageTrigger trigger,
            MessageInteractions interactions, Map<String, dynamic> context)?
        dynamic,
    required TResult orElse(),
  }) {
    if (dynamic != null) {
      return dynamic(message, trigger, interactions, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DynamicMessageContext value) dynamic,
  }) {
    return dynamic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DynamicMessageContext value)? dynamic,
  }) {
    return dynamic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DynamicMessageContext value)? dynamic,
    required TResult orElse(),
  }) {
    if (dynamic != null) {
      return dynamic(this);
    }
    return orElse();
  }
}

abstract class DynamicMessageContext extends MessageContext {
  const factory DynamicMessageContext(
          {required final DynamicMessage message,
          required final MessageTrigger trigger,
          required final MessageInteractions interactions,
          required final Map<String, dynamic> context}) =
      _$DynamicMessageContextImpl;
  const DynamicMessageContext._() : super._();

  @override
  DynamicMessage get message;

  /// For Trigger conditions
  @override
  MessageTrigger get trigger;

  /// For Interactions conditions
  @override
  MessageInteractions get interactions;

  /// For Interactions conditions
  @override
  Map<String, dynamic> get context;

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DynamicMessageContextImplCopyWith<_$DynamicMessageContextImpl>
      get copyWith => throw _privateConstructorUsedError;
}
