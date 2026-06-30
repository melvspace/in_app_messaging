import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_context.freezed.dart';
part 'user_context.g.dart';

/// User attributes exposed under the `user` key in condition data.
@freezed
abstract class UserContext with _$UserContext {
  const UserContext._();

  /// Creates user condition data.
  const factory UserContext({
    /// Stable user identifier used by configured conditions.
    String? id,

    /// User display name available to conditions and templates.
    String? name,

    /// User email address available to conditions and templates.
    String? email,

    /// User phone number available to conditions and templates.
    String? phone,

    /// User language code available to conditions and templates.
    String? language,

    /// Custom string properties that did not map to a typed field.
    @Default({}) Map<String, String> extra,
  }) = _UserContext;

  /// Looks up [key] across typed fields and [extra].
  String getByKey(String key) {
    return {
      ...extra,
      ...toJson(),
    }[key];
  }

  /// Returns a copy with [key] updated in the serialized user data.
  UserContext change(String key, String value) {
    final json = toJson();
    json[key] = value;

    return UserContext.fromJson(json);
  }

  /// Parses user data and preserves unknown string values in [extra].
  factory UserContext.fromJson(Map<String, dynamic> json) =>
      _$UserContextFromJson(
        {
          ...json,
          'extra': {...json} //
            ..removeWhere((k, v) => v is! String),
        },
      );
}
