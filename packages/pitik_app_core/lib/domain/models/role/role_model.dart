import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

typedef RoleList = List<Role>;

@freezed
class Role with _$Role {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
 const  factory Role({
    String? id,
    String? name,
  }) = _Role;

  factory Role.fromJson(dynamic json) => _$RoleFromJson(json);
}
