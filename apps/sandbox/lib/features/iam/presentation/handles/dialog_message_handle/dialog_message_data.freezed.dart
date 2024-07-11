// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dialog_message_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DialogMessageData _$DialogMessageDataFromJson(Map<String, dynamic> json) {
  return _DialogMessageData.fromJson(json);
}

/// @nodoc
mixin _$DialogMessageData {
  String get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  List<DialogMessageAction> get actions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DialogMessageDataCopyWith<DialogMessageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogMessageDataCopyWith<$Res> {
  factory $DialogMessageDataCopyWith(
          DialogMessageData value, $Res Function(DialogMessageData) then) =
      _$DialogMessageDataCopyWithImpl<$Res, DialogMessageData>;
  @useResult
  $Res call({String title, String? body, List<DialogMessageAction> actions});
}

/// @nodoc
class _$DialogMessageDataCopyWithImpl<$Res, $Val extends DialogMessageData>
    implements $DialogMessageDataCopyWith<$Res> {
  _$DialogMessageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = freezed,
    Object? actions = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<DialogMessageAction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DialogMessageDataImplCopyWith<$Res>
    implements $DialogMessageDataCopyWith<$Res> {
  factory _$$DialogMessageDataImplCopyWith(_$DialogMessageDataImpl value,
          $Res Function(_$DialogMessageDataImpl) then) =
      __$$DialogMessageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String? body, List<DialogMessageAction> actions});
}

/// @nodoc
class __$$DialogMessageDataImplCopyWithImpl<$Res>
    extends _$DialogMessageDataCopyWithImpl<$Res, _$DialogMessageDataImpl>
    implements _$$DialogMessageDataImplCopyWith<$Res> {
  __$$DialogMessageDataImplCopyWithImpl(_$DialogMessageDataImpl _value,
      $Res Function(_$DialogMessageDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = freezed,
    Object? actions = null,
  }) {
    return _then(_$DialogMessageDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<DialogMessageAction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DialogMessageDataImpl implements _DialogMessageData {
  const _$DialogMessageDataImpl(
      {required this.title,
      this.body,
      final List<DialogMessageAction> actions = const []})
      : _actions = actions;

  factory _$DialogMessageDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DialogMessageDataImplFromJson(json);

  @override
  final String title;
  @override
  final String? body;
  final List<DialogMessageAction> _actions;
  @override
  @JsonKey()
  List<DialogMessageAction> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  String toString() {
    return 'DialogMessageData(title: $title, body: $body, actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DialogMessageDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality().equals(other._actions, _actions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, body, const DeepCollectionEquality().hash(_actions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DialogMessageDataImplCopyWith<_$DialogMessageDataImpl> get copyWith =>
      __$$DialogMessageDataImplCopyWithImpl<_$DialogMessageDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DialogMessageDataImplToJson(
      this,
    );
  }
}

abstract class _DialogMessageData implements DialogMessageData {
  const factory _DialogMessageData(
      {required final String title,
      final String? body,
      final List<DialogMessageAction> actions}) = _$DialogMessageDataImpl;

  factory _DialogMessageData.fromJson(Map<String, dynamic> json) =
      _$DialogMessageDataImpl.fromJson;

  @override
  String get title;
  @override
  String? get body;
  @override
  List<DialogMessageAction> get actions;
  @override
  @JsonKey(ignore: true)
  _$$DialogMessageDataImplCopyWith<_$DialogMessageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DialogMessageAction _$DialogMessageActionFromJson(Map<String, dynamic> json) {
  return _DialogMessageAction.fromJson(json);
}

/// @nodoc
mixin _$DialogMessageAction {
  String get text => throw _privateConstructorUsedError;
  DialogMessageDataClick? get click => throw _privateConstructorUsedError;
  List<String> get events => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DialogMessageActionCopyWith<DialogMessageAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogMessageActionCopyWith<$Res> {
  factory $DialogMessageActionCopyWith(
          DialogMessageAction value, $Res Function(DialogMessageAction) then) =
      _$DialogMessageActionCopyWithImpl<$Res, DialogMessageAction>;
  @useResult
  $Res call({String text, DialogMessageDataClick? click, List<String> events});

  $DialogMessageDataClickCopyWith<$Res>? get click;
}

/// @nodoc
class _$DialogMessageActionCopyWithImpl<$Res, $Val extends DialogMessageAction>
    implements $DialogMessageActionCopyWith<$Res> {
  _$DialogMessageActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? click = freezed,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      click: freezed == click
          ? _value.click
          : click // ignore: cast_nullable_to_non_nullable
              as DialogMessageDataClick?,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DialogMessageDataClickCopyWith<$Res>? get click {
    if (_value.click == null) {
      return null;
    }

    return $DialogMessageDataClickCopyWith<$Res>(_value.click!, (value) {
      return _then(_value.copyWith(click: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DialogMessageActionImplCopyWith<$Res>
    implements $DialogMessageActionCopyWith<$Res> {
  factory _$$DialogMessageActionImplCopyWith(_$DialogMessageActionImpl value,
          $Res Function(_$DialogMessageActionImpl) then) =
      __$$DialogMessageActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, DialogMessageDataClick? click, List<String> events});

  @override
  $DialogMessageDataClickCopyWith<$Res>? get click;
}

/// @nodoc
class __$$DialogMessageActionImplCopyWithImpl<$Res>
    extends _$DialogMessageActionCopyWithImpl<$Res, _$DialogMessageActionImpl>
    implements _$$DialogMessageActionImplCopyWith<$Res> {
  __$$DialogMessageActionImplCopyWithImpl(_$DialogMessageActionImpl _value,
      $Res Function(_$DialogMessageActionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? click = freezed,
    Object? events = null,
  }) {
    return _then(_$DialogMessageActionImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      click: freezed == click
          ? _value.click
          : click // ignore: cast_nullable_to_non_nullable
              as DialogMessageDataClick?,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DialogMessageActionImpl implements _DialogMessageAction {
  const _$DialogMessageActionImpl(
      {required this.text, this.click, final List<String> events = const []})
      : _events = events;

  factory _$DialogMessageActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DialogMessageActionImplFromJson(json);

  @override
  final String text;
  @override
  final DialogMessageDataClick? click;
  final List<String> _events;
  @override
  @JsonKey()
  List<String> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'DialogMessageAction(text: $text, click: $click, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DialogMessageActionImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.click, click) || other.click == click) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, text, click, const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DialogMessageActionImplCopyWith<_$DialogMessageActionImpl> get copyWith =>
      __$$DialogMessageActionImplCopyWithImpl<_$DialogMessageActionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DialogMessageActionImplToJson(
      this,
    );
  }
}

abstract class _DialogMessageAction implements DialogMessageAction {
  const factory _DialogMessageAction(
      {required final String text,
      final DialogMessageDataClick? click,
      final List<String> events}) = _$DialogMessageActionImpl;

  factory _DialogMessageAction.fromJson(Map<String, dynamic> json) =
      _$DialogMessageActionImpl.fromJson;

  @override
  String get text;
  @override
  DialogMessageDataClick? get click;
  @override
  List<String> get events;
  @override
  @JsonKey(ignore: true)
  _$$DialogMessageActionImplCopyWith<_$DialogMessageActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DialogMessageDataClick _$DialogMessageDataClickFromJson(
    Map<String, dynamic> json) {
  return DialogPopClickAction.fromJson(json);
}

/// @nodoc
mixin _$DialogMessageDataClick {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DialogPopClickAction value) pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DialogPopClickAction value)? pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DialogPopClickAction value)? pop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogMessageDataClickCopyWith<$Res> {
  factory $DialogMessageDataClickCopyWith(DialogMessageDataClick value,
          $Res Function(DialogMessageDataClick) then) =
      _$DialogMessageDataClickCopyWithImpl<$Res, DialogMessageDataClick>;
}

/// @nodoc
class _$DialogMessageDataClickCopyWithImpl<$Res,
        $Val extends DialogMessageDataClick>
    implements $DialogMessageDataClickCopyWith<$Res> {
  _$DialogMessageDataClickCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DialogPopClickActionImplCopyWith<$Res> {
  factory _$$DialogPopClickActionImplCopyWith(_$DialogPopClickActionImpl value,
          $Res Function(_$DialogPopClickActionImpl) then) =
      __$$DialogPopClickActionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DialogPopClickActionImplCopyWithImpl<$Res>
    extends _$DialogMessageDataClickCopyWithImpl<$Res,
        _$DialogPopClickActionImpl>
    implements _$$DialogPopClickActionImplCopyWith<$Res> {
  __$$DialogPopClickActionImplCopyWithImpl(_$DialogPopClickActionImpl _value,
      $Res Function(_$DialogPopClickActionImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$DialogPopClickActionImpl implements DialogPopClickAction {
  const _$DialogPopClickActionImpl();

  factory _$DialogPopClickActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DialogPopClickActionImplFromJson(json);

  @override
  String toString() {
    return 'DialogMessageDataClick.pop()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DialogPopClickActionImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pop,
  }) {
    return pop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pop,
  }) {
    return pop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pop,
    required TResult orElse(),
  }) {
    if (pop != null) {
      return pop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DialogPopClickAction value) pop,
  }) {
    return pop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DialogPopClickAction value)? pop,
  }) {
    return pop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DialogPopClickAction value)? pop,
    required TResult orElse(),
  }) {
    if (pop != null) {
      return pop(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DialogPopClickActionImplToJson(
      this,
    );
  }
}

abstract class DialogPopClickAction implements DialogMessageDataClick {
  const factory DialogPopClickAction() = _$DialogPopClickActionImpl;

  factory DialogPopClickAction.fromJson(Map<String, dynamic> json) =
      _$DialogPopClickActionImpl.fromJson;
}
