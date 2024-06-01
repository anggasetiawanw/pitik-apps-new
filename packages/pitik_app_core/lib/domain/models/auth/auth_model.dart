import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class Auth with _$Auth {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory Auth({
    String? id,
    String? token,
    String? refreshToken,
    int? acceptTnc,
    String? action,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
