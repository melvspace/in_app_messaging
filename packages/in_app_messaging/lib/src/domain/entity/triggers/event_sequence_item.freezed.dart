// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_sequence_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventSequenceItem _$EventSequenceItemFromJson(Map<String, dynamic> json) {
  return _EventSequenceItem.fromJson(json);
}

/// @nodoc
mixin _$EventSequenceItem {
  String get name => throw _privateConstructorUsedError;

  /// Indicates that the event is expected in the sequence
  ///
  /// If value is false and event occured as trigger it elimates any existing pending sequence.
  ///
  /// Example:
  ///   - `exam_completed, exam_closed, !diploma_form_opened(for 2 seconds)`
  ///   - if `diploma_form_opened` occured in 2 seconds after `exam_closed` whole sequence is dropped
  bool get expected => throw _privateConstructorUsedError;

  /// Maximum delay since previous event in seconds
  ///
  /// By default checked against infinite delay
  double? get maxDelay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventSequenceItemCopyWith<EventSequenceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventSequenceItemCopyWith<$Res> {
  factory $EventSequenceItemCopyWith(
          EventSequenceItem value, $Res Function(EventSequenceItem) then) =
      _$EventSequenceItemCopyWithImpl<$Res, EventSequenceItem>;
  @useResult
  $Res call({String name, bool expected, double? maxDelay});
}

/// @nodoc
class _$EventSequenceItemCopyWithImpl<$Res, $Val extends EventSequenceItem>
    implements $EventSequenceItemCopyWith<$Res> {
  _$EventSequenceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? expected = null,
    Object? maxDelay = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      expected: null == expected
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as bool,
      maxDelay: freezed == maxDelay
          ? _value.maxDelay
          : maxDelay // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventSequenceItemImplCopyWith<$Res>
    implements $EventSequenceItemCopyWith<$Res> {
  factory _$$EventSequenceItemImplCopyWith(_$EventSequenceItemImpl value,
          $Res Function(_$EventSequenceItemImpl) then) =
      __$$EventSequenceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool expected, double? maxDelay});
}

/// @nodoc
class __$$EventSequenceItemImplCopyWithImpl<$Res>
    extends _$EventSequenceItemCopyWithImpl<$Res, _$EventSequenceItemImpl>
    implements _$$EventSequenceItemImplCopyWith<$Res> {
  __$$EventSequenceItemImplCopyWithImpl(_$EventSequenceItemImpl _value,
      $Res Function(_$EventSequenceItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? expected = null,
    Object? maxDelay = freezed,
  }) {
    return _then(_$EventSequenceItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      expected: null == expected
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as bool,
      maxDelay: freezed == maxDelay
          ? _value.maxDelay
          : maxDelay // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventSequenceItemImpl implements _EventSequenceItem {
  const _$EventSequenceItemImpl(
      {required this.name, this.expected = true, this.maxDelay});

  factory _$EventSequenceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventSequenceItemImplFromJson(json);

  @override
  final String name;

  /// Indicates that the event is expected in the sequence
  ///
  /// If value is false and event occured as trigger it elimates any existing pending sequence.
  ///
  /// Example:
  ///   - `exam_completed, exam_closed, !diploma_form_opened(for 2 seconds)`
  ///   - if `diploma_form_opened` occured in 2 seconds after `exam_closed` whole sequence is dropped
  @override
  @JsonKey()
  final bool expected;

  /// Maximum delay since previous event in seconds
  ///
  /// By default checked against infinite delay
  @override
  final double? maxDelay;

  @override
  String toString() {
    return 'EventSequenceItem(name: $name, expected: $expected, maxDelay: $maxDelay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSequenceItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.expected, expected) ||
                other.expected == expected) &&
            (identical(other.maxDelay, maxDelay) ||
                other.maxDelay == maxDelay));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, expected, maxDelay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventSequenceItemImplCopyWith<_$EventSequenceItemImpl> get copyWith =>
      __$$EventSequenceItemImplCopyWithImpl<_$EventSequenceItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventSequenceItemImplToJson(
      this,
    );
  }
}

abstract class _EventSequenceItem implements EventSequenceItem {
  const factory _EventSequenceItem(
      {required final String name,
      final bool expected,
      final double? maxDelay}) = _$EventSequenceItemImpl;

  factory _EventSequenceItem.fromJson(Map<String, dynamic> json) =
      _$EventSequenceItemImpl.fromJson;

  @override
  String get name;
  @override

  /// Indicates that the event is expected in the sequence
  ///
  /// If value is false and event occured as trigger it elimates any existing pending sequence.
  ///
  /// Example:
  ///   - `exam_completed, exam_closed, !diploma_form_opened(for 2 seconds)`
  ///   - if `diploma_form_opened` occured in 2 seconds after `exam_closed` whole sequence is dropped
  bool get expected;
  @override

  /// Maximum delay since previous event in seconds
  ///
  /// By default checked against infinite delay
  double? get maxDelay;
  @override
  @JsonKey(ignore: true)
  _$$EventSequenceItemImplCopyWith<_$EventSequenceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
