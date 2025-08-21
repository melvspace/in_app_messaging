// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageContext {
  DynamicMessage get message;

  /// For Trigger conditions
  MessageTrigger get trigger;

  /// For Interactions conditions
  MessageInteractions get interactions;

  /// For Interactions conditions
  Map<String, dynamic> get context;

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageContextCopyWith<MessageContext> get copyWith =>
      _$MessageContextCopyWithImpl<MessageContext>(
          this as MessageContext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageContext &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            (identical(other.interactions, interactions) ||
                other.interactions == interactions) &&
            const DeepCollectionEquality().equals(other.context, context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, trigger, interactions,
      const DeepCollectionEquality().hash(context));

  @override
  String toString() {
    return 'MessageContext(message: $message, trigger: $trigger, interactions: $interactions, context: $context)';
  }
}

/// @nodoc
abstract mixin class $MessageContextCopyWith<$Res> {
  factory $MessageContextCopyWith(
          MessageContext value, $Res Function(MessageContext) _then) =
      _$MessageContextCopyWithImpl;
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
class _$MessageContextCopyWithImpl<$Res>
    implements $MessageContextCopyWith<$Res> {
  _$MessageContextCopyWithImpl(this._self, this._then);

  final MessageContext _self;
  final $Res Function(MessageContext) _then;

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
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as DynamicMessage,
      trigger: null == trigger
          ? _self.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as MessageTrigger,
      interactions: null == interactions
          ? _self.interactions
          : interactions // ignore: cast_nullable_to_non_nullable
              as MessageInteractions,
      context: null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageTriggerCopyWith<$Res> get trigger {
    return $MessageTriggerCopyWith<$Res>(_self.trigger, (value) {
      return _then(_self.copyWith(trigger: value));
    });
  }

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageInteractionsCopyWith<$Res> get interactions {
    return $MessageInteractionsCopyWith<$Res>(_self.interactions, (value) {
      return _then(_self.copyWith(interactions: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MessageContext].
extension MessageContextPatterns on MessageContext {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DynamicMessageContext value)? dynamic,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DynamicMessageContext() when dynamic != null:
        return dynamic(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(DynamicMessageContext value) dynamic,
  }) {
    final _that = this;
    switch (_that) {
      case DynamicMessageContext():
        return dynamic(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DynamicMessageContext value)? dynamic,
  }) {
    final _that = this;
    switch (_that) {
      case DynamicMessageContext() when dynamic != null:
        return dynamic(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DynamicMessage message, MessageTrigger trigger,
            MessageInteractions interactions, Map<String, dynamic> context)?
        dynamic,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DynamicMessageContext() when dynamic != null:
        return dynamic(
            _that.message, _that.trigger, _that.interactions, _that.context);
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
  TResult when<TResult extends Object?>({
    required TResult Function(DynamicMessage message, MessageTrigger trigger,
            MessageInteractions interactions, Map<String, dynamic> context)
        dynamic,
  }) {
    final _that = this;
    switch (_that) {
      case DynamicMessageContext():
        return dynamic(
            _that.message, _that.trigger, _that.interactions, _that.context);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DynamicMessage message, MessageTrigger trigger,
            MessageInteractions interactions, Map<String, dynamic> context)?
        dynamic,
  }) {
    final _that = this;
    switch (_that) {
      case DynamicMessageContext() when dynamic != null:
        return dynamic(
            _that.message, _that.trigger, _that.interactions, _that.context);
      case _:
        return null;
    }
  }
}

/// @nodoc

class DynamicMessageContext extends MessageContext {
  const DynamicMessageContext(
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

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DynamicMessageContextCopyWith<DynamicMessageContext> get copyWith =>
      _$DynamicMessageContextCopyWithImpl<DynamicMessageContext>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DynamicMessageContext &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            (identical(other.interactions, interactions) ||
                other.interactions == interactions) &&
            const DeepCollectionEquality().equals(other._context, _context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, trigger, interactions,
      const DeepCollectionEquality().hash(_context));

  @override
  String toString() {
    return 'MessageContext.dynamic(message: $message, trigger: $trigger, interactions: $interactions, context: $context)';
  }
}

/// @nodoc
abstract mixin class $DynamicMessageContextCopyWith<$Res>
    implements $MessageContextCopyWith<$Res> {
  factory $DynamicMessageContextCopyWith(DynamicMessageContext value,
          $Res Function(DynamicMessageContext) _then) =
      _$DynamicMessageContextCopyWithImpl;
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
class _$DynamicMessageContextCopyWithImpl<$Res>
    implements $DynamicMessageContextCopyWith<$Res> {
  _$DynamicMessageContextCopyWithImpl(this._self, this._then);

  final DynamicMessageContext _self;
  final $Res Function(DynamicMessageContext) _then;

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? trigger = null,
    Object? interactions = null,
    Object? context = null,
  }) {
    return _then(DynamicMessageContext(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as DynamicMessage,
      trigger: null == trigger
          ? _self.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as MessageTrigger,
      interactions: null == interactions
          ? _self.interactions
          : interactions // ignore: cast_nullable_to_non_nullable
              as MessageInteractions,
      context: null == context
          ? _self._context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageTriggerCopyWith<$Res> get trigger {
    return $MessageTriggerCopyWith<$Res>(_self.trigger, (value) {
      return _then(_self.copyWith(trigger: value));
    });
  }

  /// Create a copy of MessageContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageInteractionsCopyWith<$Res> get interactions {
    return $MessageInteractionsCopyWith<$Res>(_self.interactions, (value) {
      return _then(_self.copyWith(interactions: value));
    });
  }
}

// dart format on
