// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_interactions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessageInteractions {
  /// message id
  String get message => throw _privateConstructorUsedError;

  /// dates when user seend this message
  List<DateTime> get seenDates => throw _privateConstructorUsedError;

  /// additional dynamic interactions
  Map<String, dynamic> get additional => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageInteractionsCopyWith<MessageInteractions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageInteractionsCopyWith<$Res> {
  factory $MessageInteractionsCopyWith(
          MessageInteractions value, $Res Function(MessageInteractions) then) =
      _$MessageInteractionsCopyWithImpl<$Res, MessageInteractions>;
  @useResult
  $Res call(
      {String message,
      List<DateTime> seenDates,
      Map<String, dynamic> additional});
}

/// @nodoc
class _$MessageInteractionsCopyWithImpl<$Res, $Val extends MessageInteractions>
    implements $MessageInteractionsCopyWith<$Res> {
  _$MessageInteractionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? seenDates = null,
    Object? additional = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      seenDates: null == seenDates
          ? _value.seenDates
          : seenDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      additional: null == additional
          ? _value.additional
          : additional // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageInteractionsImplCopyWith<$Res>
    implements $MessageInteractionsCopyWith<$Res> {
  factory _$$MessageInteractionsImplCopyWith(_$MessageInteractionsImpl value,
          $Res Function(_$MessageInteractionsImpl) then) =
      __$$MessageInteractionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      List<DateTime> seenDates,
      Map<String, dynamic> additional});
}

/// @nodoc
class __$$MessageInteractionsImplCopyWithImpl<$Res>
    extends _$MessageInteractionsCopyWithImpl<$Res, _$MessageInteractionsImpl>
    implements _$$MessageInteractionsImplCopyWith<$Res> {
  __$$MessageInteractionsImplCopyWithImpl(_$MessageInteractionsImpl _value,
      $Res Function(_$MessageInteractionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? seenDates = null,
    Object? additional = null,
  }) {
    return _then(_$MessageInteractionsImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      seenDates: null == seenDates
          ? _value._seenDates
          : seenDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      additional: null == additional
          ? _value._additional
          : additional // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$MessageInteractionsImpl
    with DiagnosticableTreeMixin
    implements _MessageInteractions {
  const _$MessageInteractionsImpl(
      {required this.message,
      required final List<DateTime> seenDates,
      required final Map<String, dynamic> additional})
      : _seenDates = seenDates,
        _additional = additional;

  /// message id
  @override
  final String message;

  /// dates when user seend this message
  final List<DateTime> _seenDates;

  /// dates when user seend this message
  @override
  List<DateTime> get seenDates {
    if (_seenDates is EqualUnmodifiableListView) return _seenDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seenDates);
  }

  /// additional dynamic interactions
  final Map<String, dynamic> _additional;

  /// additional dynamic interactions
  @override
  Map<String, dynamic> get additional {
    if (_additional is EqualUnmodifiableMapView) return _additional;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_additional);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageInteractions(message: $message, seenDates: $seenDates, additional: $additional)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageInteractions'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('seenDates', seenDates))
      ..add(DiagnosticsProperty('additional', additional));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageInteractionsImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._seenDates, _seenDates) &&
            const DeepCollectionEquality()
                .equals(other._additional, _additional));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      const DeepCollectionEquality().hash(_seenDates),
      const DeepCollectionEquality().hash(_additional));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageInteractionsImplCopyWith<_$MessageInteractionsImpl> get copyWith =>
      __$$MessageInteractionsImplCopyWithImpl<_$MessageInteractionsImpl>(
          this, _$identity);
}

abstract class _MessageInteractions implements MessageInteractions {
  const factory _MessageInteractions(
          {required final String message,
          required final List<DateTime> seenDates,
          required final Map<String, dynamic> additional}) =
      _$MessageInteractionsImpl;

  @override

  /// message id
  String get message;
  @override

  /// dates when user seend this message
  List<DateTime> get seenDates;
  @override

  /// additional dynamic interactions
  Map<String, dynamic> get additional;
  @override
  @JsonKey(ignore: true)
  _$$MessageInteractionsImplCopyWith<_$MessageInteractionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
