// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_seen_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageSeenEntry _$MessageSeenEntryFromJson(Map<String, dynamic> json) {
  return _MessageSeenEntry.fromJson(json);
}

/// @nodoc
mixin _$MessageSeenEntry {
  DateTime get date => throw _privateConstructorUsedError;
  String? get trigger => throw _privateConstructorUsedError;
  Map<String, dynamic>? get triggerProperties =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageSeenEntryCopyWith<MessageSeenEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageSeenEntryCopyWith<$Res> {
  factory $MessageSeenEntryCopyWith(
          MessageSeenEntry value, $Res Function(MessageSeenEntry) then) =
      _$MessageSeenEntryCopyWithImpl<$Res, MessageSeenEntry>;
  @useResult
  $Res call(
      {DateTime date,
      String? trigger,
      Map<String, dynamic>? triggerProperties});
}

/// @nodoc
class _$MessageSeenEntryCopyWithImpl<$Res, $Val extends MessageSeenEntry>
    implements $MessageSeenEntryCopyWith<$Res> {
  _$MessageSeenEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? trigger = freezed,
    Object? triggerProperties = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      trigger: freezed == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as String?,
      triggerProperties: freezed == triggerProperties
          ? _value.triggerProperties
          : triggerProperties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageSeenEntryImplCopyWith<$Res>
    implements $MessageSeenEntryCopyWith<$Res> {
  factory _$$MessageSeenEntryImplCopyWith(_$MessageSeenEntryImpl value,
          $Res Function(_$MessageSeenEntryImpl) then) =
      __$$MessageSeenEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      String? trigger,
      Map<String, dynamic>? triggerProperties});
}

/// @nodoc
class __$$MessageSeenEntryImplCopyWithImpl<$Res>
    extends _$MessageSeenEntryCopyWithImpl<$Res, _$MessageSeenEntryImpl>
    implements _$$MessageSeenEntryImplCopyWith<$Res> {
  __$$MessageSeenEntryImplCopyWithImpl(_$MessageSeenEntryImpl _value,
      $Res Function(_$MessageSeenEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? trigger = freezed,
    Object? triggerProperties = freezed,
  }) {
    return _then(_$MessageSeenEntryImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      trigger: freezed == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as String?,
      triggerProperties: freezed == triggerProperties
          ? _value._triggerProperties
          : triggerProperties // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageSeenEntryImpl implements _MessageSeenEntry {
  const _$MessageSeenEntryImpl(
      {required this.date,
      this.trigger,
      final Map<String, dynamic>? triggerProperties})
      : _triggerProperties = triggerProperties;

  factory _$MessageSeenEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageSeenEntryImplFromJson(json);

  @override
  final DateTime date;
  @override
  final String? trigger;
  final Map<String, dynamic>? _triggerProperties;
  @override
  Map<String, dynamic>? get triggerProperties {
    final value = _triggerProperties;
    if (value == null) return null;
    if (_triggerProperties is EqualUnmodifiableMapView)
      return _triggerProperties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'MessageSeenEntry(date: $date, trigger: $trigger, triggerProperties: $triggerProperties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageSeenEntryImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            const DeepCollectionEquality()
                .equals(other._triggerProperties, _triggerProperties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, trigger,
      const DeepCollectionEquality().hash(_triggerProperties));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageSeenEntryImplCopyWith<_$MessageSeenEntryImpl> get copyWith =>
      __$$MessageSeenEntryImplCopyWithImpl<_$MessageSeenEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageSeenEntryImplToJson(
      this,
    );
  }
}

abstract class _MessageSeenEntry implements MessageSeenEntry {
  const factory _MessageSeenEntry(
      {required final DateTime date,
      final String? trigger,
      final Map<String, dynamic>? triggerProperties}) = _$MessageSeenEntryImpl;

  factory _MessageSeenEntry.fromJson(Map<String, dynamic> json) =
      _$MessageSeenEntryImpl.fromJson;

  @override
  DateTime get date;
  @override
  String? get trigger;
  @override
  Map<String, dynamic>? get triggerProperties;
  @override
  @JsonKey(ignore: true)
  _$$MessageSeenEntryImplCopyWith<_$MessageSeenEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
