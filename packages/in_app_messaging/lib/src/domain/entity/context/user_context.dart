import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_context.freezed.dart';
part 'user_context.g.dart';

@freezed
class UserContext with _$UserContext {
  const UserContext._();

  const factory UserContext({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? language,
    @Default({}) Map<String, String> extra,
  }) = _UserContext;

  String getByKey(String key) {
    return {
      ...extra,
      ...toJson(),
    }[key];
  }

  UserContext change(String key, String value) {
    final json = toJson();
    json[key] = value;

    return UserContext.fromJson(json);
  }

  factory UserContext.fromJson(Map<String, dynamic> json) =>
      _$UserContextFromJson(
        {
          ...json,
          'extra': {...json} //
            ..removeWhere((k, v) => v is! String),
        },
      );
}
