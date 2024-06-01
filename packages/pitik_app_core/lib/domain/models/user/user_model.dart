import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pitik_app_core/domain/models/role/role_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

typedef UserList = List<User>;

@freezed
class User with _$User {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory User({
    String? id,
    String? username,
    String? password,
    String? oldPassword,
    String? newPassword,
    String? confirmationPassword,
    String? cmsId,
    String? name,
    String? email,
    String? phoneNumber,
    String? waNumber,
    String? role,
    String? organizationId,
    String? organizationName,
    String? createdDate,
    String? userCode,
    String? userName,
    String? fullName,
    String? userType,
    int? status,
    String? refOwnerId,
    RoleList? roles,
    // @Default(Module()) Module modules,
    // @Default(Branch()) Branch branch,
    String? farmingCycleId,
    String? ownerId,
  }) = _User;

  const User._();

  factory User.fromJson(dynamic json) => _$UserFromJson(json);
}
