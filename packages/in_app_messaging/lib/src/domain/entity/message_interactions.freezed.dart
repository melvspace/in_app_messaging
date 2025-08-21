// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_interactions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageInteractions implements DiagnosticableTreeMixin {
  /// message id
  String get message;

  /// dates when user seend this message
  List<MessageSeenEntry> get seenEntries;

  /// Create a copy of MessageInteractions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageInteractionsCopyWith<MessageInteractions> get copyWith =>
      _$MessageInteractionsCopyWithImpl<MessageInteractions>(
          this as MessageInteractions, _$identity);

  /// Serializes this MessageInteractions to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MessageInteractions'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('seenEntries', seenEntries));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageInteractions &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other.seenEntries, seenEntries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(seenEntries));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageInteractions(message: $message, seenEntries: $seenEntries)';
  }
}

/// @nodoc
abstract mixin class $MessageInteractionsCopyWith<$Res> {
  factory $MessageInteractionsCopyWith(
          MessageInteractions value, $Res Function(MessageInteractions) _then) =
      _$MessageInteractionsCopyWithImpl;
  @useResult
  $Res call({String message, List<MessageSeenEntry> seenEntries});
}

/// @nodoc
class _$MessageInteractionsCopyWithImpl<$Res>
    implements $MessageInteractionsCopyWith<$Res> {
  _$MessageInteractionsCopyWithImpl(this._self, this._then);

  final MessageInteractions _self;
  final $Res Function(MessageInteractions) _then;

  /// Create a copy of MessageInteractions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? seenEntries = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      seenEntries: null == seenEntries
          ? _self.seenEntries
          : seenEntries // ignore: cast_nullable_to_non_nullable
              as List<MessageSeenEntry>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MessageInteractions].
extension MessageInteractionsPatterns on MessageInteractions {
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
    TResult Function(_MessageInteractions value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessageInteractions() when $default != null:
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
    TResult Function(_MessageInteractions value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageInteractions():
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
    TResult? Function(_MessageInteractions value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageInteractions() when $default != null:
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
    TResult Function(String message, List<MessageSeenEntry> seenEntries)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessageInteractions() when $default != null:
        return $default(_that.message, _that.seenEntries);
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
    TResult Function(String message, List<MessageSeenEntry> seenEntries)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageInteractions():
        return $default(_that.message, _that.seenEntries);
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
    TResult? Function(String message, List<MessageSeenEntry> seenEntries)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageInteractions() when $default != null:
        return $default(_that.message, _that.seenEntries);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MessageInteractions
    with DiagnosticableTreeMixin
    implements MessageInteractions {
  const _MessageInteractions(
      {required this.message,
      required final List<MessageSeenEntry> seenEntries})
      : _seenEntries = seenEntries;
  factory _MessageInteractions.fromJson(Map<String, dynamic> json) =>
      _$MessageInteractionsFromJson(json);

  /// message id
  @override
  final String message;

  /// dates when user seend this message
  final List<MessageSeenEntry> _seenEntries;

  /// dates when user seend this message
  @override
  List<MessageSeenEntry> get seenEntries {
    if (_seenEntries is EqualUnmodifiableListView) return _seenEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seenEntries);
  }

  /// Create a copy of MessageInteractions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageInteractionsCopyWith<_MessageInteractions> get copyWith =>
      __$MessageInteractionsCopyWithImpl<_MessageInteractions>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageInteractionsToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MessageInteractions'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('seenEntries', seenEntries));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageInteractions &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._seenEntries, _seenEntries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_seenEntries));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageInteractions(message: $message, seenEntries: $seenEntries)';
  }
}

/// @nodoc
abstract mixin class _$MessageInteractionsCopyWith<$Res>
    implements $MessageInteractionsCopyWith<$Res> {
  factory _$MessageInteractionsCopyWith(_MessageInteractions value,
          $Res Function(_MessageInteractions) _then) =
      __$MessageInteractionsCopyWithImpl;
  @override
  @useResult
  $Res call({String message, List<MessageSeenEntry> seenEntries});
}

/// @nodoc
class __$MessageInteractionsCopyWithImpl<$Res>
    implements _$MessageInteractionsCopyWith<$Res> {
  __$MessageInteractionsCopyWithImpl(this._self, this._then);

  final _MessageInteractions _self;
  final $Res Function(_MessageInteractions) _then;

  /// Create a copy of MessageInteractions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? seenEntries = null,
  }) {
    return _then(_MessageInteractions(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      seenEntries: null == seenEntries
          ? _self._seenEntries
          : seenEntries // ignore: cast_nullable_to_non_nullable
              as List<MessageSeenEntry>,
    ));
  }
}

// dart format on
