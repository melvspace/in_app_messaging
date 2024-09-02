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

MessageInteractions _$MessageInteractionsFromJson(Map<String, dynamic> json) {
  return _MessageInteractions.fromJson(json);
}

/// @nodoc
mixin _$MessageInteractions {
  /// message id
  String get message => throw _privateConstructorUsedError;

  /// dates when user seend this message
  List<MessageSeenEntry> get seenEntries => throw _privateConstructorUsedError;

  /// Serializes this MessageInteractions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageInteractions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageInteractionsCopyWith<MessageInteractions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageInteractionsCopyWith<$Res> {
  factory $MessageInteractionsCopyWith(
          MessageInteractions value, $Res Function(MessageInteractions) then) =
      _$MessageInteractionsCopyWithImpl<$Res, MessageInteractions>;
  @useResult
  $Res call({String message, List<MessageSeenEntry> seenEntries});
}

/// @nodoc
class _$MessageInteractionsCopyWithImpl<$Res, $Val extends MessageInteractions>
    implements $MessageInteractionsCopyWith<$Res> {
  _$MessageInteractionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageInteractions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? seenEntries = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      seenEntries: null == seenEntries
          ? _value.seenEntries
          : seenEntries // ignore: cast_nullable_to_non_nullable
              as List<MessageSeenEntry>,
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
  $Res call({String message, List<MessageSeenEntry> seenEntries});
}

/// @nodoc
class __$$MessageInteractionsImplCopyWithImpl<$Res>
    extends _$MessageInteractionsCopyWithImpl<$Res, _$MessageInteractionsImpl>
    implements _$$MessageInteractionsImplCopyWith<$Res> {
  __$$MessageInteractionsImplCopyWithImpl(_$MessageInteractionsImpl _value,
      $Res Function(_$MessageInteractionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageInteractions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? seenEntries = null,
  }) {
    return _then(_$MessageInteractionsImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      seenEntries: null == seenEntries
          ? _value._seenEntries
          : seenEntries // ignore: cast_nullable_to_non_nullable
              as List<MessageSeenEntry>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageInteractionsImpl
    with DiagnosticableTreeMixin
    implements _MessageInteractions {
  const _$MessageInteractionsImpl(
      {required this.message,
      required final List<MessageSeenEntry> seenEntries})
      : _seenEntries = seenEntries;

  factory _$MessageInteractionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageInteractionsImplFromJson(json);

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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageInteractions(message: $message, seenEntries: $seenEntries)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageInteractions'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('seenEntries', seenEntries));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageInteractionsImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._seenEntries, _seenEntries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_seenEntries));

  /// Create a copy of MessageInteractions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageInteractionsImplCopyWith<_$MessageInteractionsImpl> get copyWith =>
      __$$MessageInteractionsImplCopyWithImpl<_$MessageInteractionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageInteractionsImplToJson(
      this,
    );
  }
}

abstract class _MessageInteractions implements MessageInteractions {
  const factory _MessageInteractions(
          {required final String message,
          required final List<MessageSeenEntry> seenEntries}) =
      _$MessageInteractionsImpl;

  factory _MessageInteractions.fromJson(Map<String, dynamic> json) =
      _$MessageInteractionsImpl.fromJson;

  /// message id
  @override
  String get message;

  /// dates when user seend this message
  @override
  List<MessageSeenEntry> get seenEntries;

  /// Create a copy of MessageInteractions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageInteractionsImplCopyWith<_$MessageInteractionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
