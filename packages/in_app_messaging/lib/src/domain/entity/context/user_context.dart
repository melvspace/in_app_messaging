import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_context.freezed.dart';
part 'user_context.g.dart';

@freezed
class UserContext with _$UserContext {
  const factory UserContext({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? language,
    @Default({}) Map<String, String> extra,
  }) = _UserContext;

  factory UserContext.fromJson(Map<String, dynamic> json) =>
      _$UserContextFromJson(json);
}
