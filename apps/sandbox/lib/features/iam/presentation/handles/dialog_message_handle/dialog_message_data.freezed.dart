// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dialog_message_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DialogMessageData {
  String get title;
  String? get body;
  List<DialogMessageAction> get actions;

  /// Create a copy of DialogMessageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DialogMessageDataCopyWith<DialogMessageData> get copyWith =>
      _$DialogMessageDataCopyWithImpl<DialogMessageData>(
          this as DialogMessageData, _$identity);

  /// Serializes this DialogMessageData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DialogMessageData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality().equals(other.actions, actions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, body, const DeepCollectionEquality().hash(actions));

  @override
  String toString() {
    return 'DialogMessageData(title: $title, body: $body, actions: $actions)';
  }
}

/// @nodoc
abstract mixin class $DialogMessageDataCopyWith<$Res> {
  factory $DialogMessageDataCopyWith(
          DialogMessageData value, $Res Function(DialogMessageData) _then) =
      _$DialogMessageDataCopyWithImpl;
  @useResult
  $Res call({String title, String? body, List<DialogMessageAction> actions});
}

/// @nodoc
class _$DialogMessageDataCopyWithImpl<$Res>
    implements $DialogMessageDataCopyWith<$Res> {
  _$DialogMessageDataCopyWithImpl(this._self, this._then);

  final DialogMessageData _self;
  final $Res Function(DialogMessageData) _then;

  /// Create a copy of DialogMessageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = freezed,
    Object? actions = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      actions: null == actions
          ? _self.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<DialogMessageAction>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DialogMessageData].
extension DialogMessageDataPatterns on DialogMessageData {
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
    TResult Function(_DialogMessageData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DialogMessageData() when $default != null:
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
    TResult Function(_DialogMessageData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DialogMessageData():
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
    TResult? Function(_DialogMessageData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DialogMessageData() when $default != null:
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
    TResult Function(
            String title, String? body, List<DialogMessageAction> actions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DialogMessageData() when $default != null:
        return $default(_that.title, _that.body, _that.actions);
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
    TResult Function(
            String title, String? body, List<DialogMessageAction> actions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DialogMessageData():
        return $default(_that.title, _that.body, _that.actions);
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
    TResult? Function(
            String title, String? body, List<DialogMessageAction> actions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DialogMessageData() when $default != null:
        return $default(_that.title, _that.body, _that.actions);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DialogMessageData implements DialogMessageData {
  const _DialogMessageData(
      {required this.title,
      this.body,
      final List<DialogMessageAction> actions = const []})
      : _actions = actions;
  factory _DialogMessageData.fromJson(Map<String, dynamic> json) =>
      _$DialogMessageDataFromJson(json);

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

  /// Create a copy of DialogMessageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DialogMessageDataCopyWith<_DialogMessageData> get copyWith =>
      __$DialogMessageDataCopyWithImpl<_DialogMessageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DialogMessageDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DialogMessageData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality().equals(other._actions, _actions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, body, const DeepCollectionEquality().hash(_actions));

  @override
  String toString() {
    return 'DialogMessageData(title: $title, body: $body, actions: $actions)';
  }
}

/// @nodoc
abstract mixin class _$DialogMessageDataCopyWith<$Res>
    implements $DialogMessageDataCopyWith<$Res> {
  factory _$DialogMessageDataCopyWith(
          _DialogMessageData value, $Res Function(_DialogMessageData) _then) =
      __$DialogMessageDataCopyWithImpl;
  @override
  @useResult
  $Res call({String title, String? body, List<DialogMessageAction> actions});
}

/// @nodoc
class __$DialogMessageDataCopyWithImpl<$Res>
    implements _$DialogMessageDataCopyWith<$Res> {
  __$DialogMessageDataCopyWithImpl(this._self, this._then);

  final _DialogMessageData _self;
  final $Res Function(_DialogMessageData) _then;

  /// Create a copy of DialogMessageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? body = freezed,
    Object? actions = null,
  }) {
    return _then(_DialogMessageData(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      actions: null == actions
          ? _self._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<DialogMessageAction>,
    ));
  }
}

/// @nodoc
mixin _$DialogMessageAction {
  String get text;
  DialogMessageDataClick? get click;
  List<String> get events;

  /// Create a copy of DialogMessageAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DialogMessageActionCopyWith<DialogMessageAction> get copyWith =>
      _$DialogMessageActionCopyWithImpl<DialogMessageAction>(
          this as DialogMessageAction, _$identity);

  /// Serializes this DialogMessageAction to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DialogMessageAction &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.click, click) || other.click == click) &&
            const DeepCollectionEquality().equals(other.events, events));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, text, click, const DeepCollectionEquality().hash(events));

  @override
  String toString() {
    return 'DialogMessageAction(text: $text, click: $click, events: $events)';
  }
}

/// @nodoc
abstract mixin class $DialogMessageActionCopyWith<$Res> {
  factory $DialogMessageActionCopyWith(
          DialogMessageAction value, $Res Function(DialogMessageAction) _then) =
      _$DialogMessageActionCopyWithImpl;
  @useResult
  $Res call({String text, DialogMessageDataClick? click, List<String> events});

  $DialogMessageDataClickCopyWith<$Res>? get click;
}

/// @nodoc
class _$DialogMessageActionCopyWithImpl<$Res>
    implements $DialogMessageActionCopyWith<$Res> {
  _$DialogMessageActionCopyWithImpl(this._self, this._then);

  final DialogMessageAction _self;
  final $Res Function(DialogMessageAction) _then;

  /// Create a copy of DialogMessageAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? click = freezed,
    Object? events = null,
  }) {
    return _then(_self.copyWith(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      click: freezed == click
          ? _self.click
          : click // ignore: cast_nullable_to_non_nullable
              as DialogMessageDataClick?,
      events: null == events
          ? _self.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of DialogMessageAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DialogMessageDataClickCopyWith<$Res>? get click {
    if (_self.click == null) {
      return null;
    }

    return $DialogMessageDataClickCopyWith<$Res>(_self.click!, (value) {
      return _then(_self.copyWith(click: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DialogMessageAction].
extension DialogMessageActionPatterns on DialogMessageAction {
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
    TResult Function(_DialogMessageAction value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DialogMessageAction() when $default != null:
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
    TResult Function(_DialogMessageAction value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DialogMessageAction():
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
    TResult? Function(_DialogMessageAction value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DialogMessageAction() when $default != null:
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
    TResult Function(
            String text, DialogMessageDataClick? click, List<String> events)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DialogMessageAction() when $default != null:
        return $default(_that.text, _that.click, _that.events);
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
    TResult Function(
            String text, DialogMessageDataClick? click, List<String> events)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DialogMessageAction():
        return $default(_that.text, _that.click, _that.events);
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
    TResult? Function(
            String text, DialogMessageDataClick? click, List<String> events)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DialogMessageAction() when $default != null:
        return $default(_that.text, _that.click, _that.events);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DialogMessageAction implements DialogMessageAction {
  const _DialogMessageAction(
      {required this.text, this.click, final List<String> events = const []})
      : _events = events;
  factory _DialogMessageAction.fromJson(Map<String, dynamic> json) =>
      _$DialogMessageActionFromJson(json);

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

  /// Create a copy of DialogMessageAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DialogMessageActionCopyWith<_DialogMessageAction> get copyWith =>
      __$DialogMessageActionCopyWithImpl<_DialogMessageAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DialogMessageActionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DialogMessageAction &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.click, click) || other.click == click) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, text, click, const DeepCollectionEquality().hash(_events));

  @override
  String toString() {
    return 'DialogMessageAction(text: $text, click: $click, events: $events)';
  }
}

/// @nodoc
abstract mixin class _$DialogMessageActionCopyWith<$Res>
    implements $DialogMessageActionCopyWith<$Res> {
  factory _$DialogMessageActionCopyWith(_DialogMessageAction value,
          $Res Function(_DialogMessageAction) _then) =
      __$DialogMessageActionCopyWithImpl;
  @override
  @useResult
  $Res call({String text, DialogMessageDataClick? click, List<String> events});

  @override
  $DialogMessageDataClickCopyWith<$Res>? get click;
}

/// @nodoc
class __$DialogMessageActionCopyWithImpl<$Res>
    implements _$DialogMessageActionCopyWith<$Res> {
  __$DialogMessageActionCopyWithImpl(this._self, this._then);

  final _DialogMessageAction _self;
  final $Res Function(_DialogMessageAction) _then;

  /// Create a copy of DialogMessageAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
    Object? click = freezed,
    Object? events = null,
  }) {
    return _then(_DialogMessageAction(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      click: freezed == click
          ? _self.click
          : click // ignore: cast_nullable_to_non_nullable
              as DialogMessageDataClick?,
      events: null == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of DialogMessageAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DialogMessageDataClickCopyWith<$Res>? get click {
    if (_self.click == null) {
      return null;
    }

    return $DialogMessageDataClickCopyWith<$Res>(_self.click!, (value) {
      return _then(_self.copyWith(click: value));
    });
  }
}

DialogMessageDataClick _$DialogMessageDataClickFromJson(
    Map<String, dynamic> json) {
  return DialogPopClickAction.fromJson(json);
}

/// @nodoc
mixin _$DialogMessageDataClick {
  /// Serializes this DialogMessageDataClick to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DialogMessageDataClick);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DialogMessageDataClick()';
  }
}

/// @nodoc
class $DialogMessageDataClickCopyWith<$Res> {
  $DialogMessageDataClickCopyWith(
      DialogMessageDataClick _, $Res Function(DialogMessageDataClick) __);
}

/// Adds pattern-matching-related methods to [DialogMessageDataClick].
extension DialogMessageDataClickPatterns on DialogMessageDataClick {
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
    TResult Function(DialogPopClickAction value)? pop,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DialogPopClickAction() when pop != null:
        return pop(_that);
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
    required TResult Function(DialogPopClickAction value) pop,
  }) {
    final _that = this;
    switch (_that) {
      case DialogPopClickAction():
        return pop(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DialogPopClickAction value)? pop,
  }) {
    final _that = this;
    switch (_that) {
      case DialogPopClickAction() when pop != null:
        return pop(_that);
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
    TResult Function()? pop,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DialogPopClickAction() when pop != null:
        return pop();
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
    required TResult Function() pop,
  }) {
    final _that = this;
    switch (_that) {
      case DialogPopClickAction():
        return pop();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pop,
  }) {
    final _that = this;
    switch (_that) {
      case DialogPopClickAction() when pop != null:
        return pop();
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class DialogPopClickAction implements DialogMessageDataClick {
  const DialogPopClickAction();
  factory DialogPopClickAction.fromJson(Map<String, dynamic> json) =>
      _$DialogPopClickActionFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$DialogPopClickActionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DialogPopClickAction);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DialogMessageDataClick.pop()';
  }
}

// dart format on
