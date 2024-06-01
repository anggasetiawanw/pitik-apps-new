// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      oldPassword: json['oldPassword'] as String?,
      newPassword: json['newPassword'] as String?,
      confirmationPassword: json['confirmationPassword'] as String?,
      cmsId: json['cmsId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      waNumber: json['waNumber'] as String?,
      role: json['role'] as String?,
      organizationId: json['organizationId'] as String?,
      organizationName: json['organizationName'] as String?,
      createdDate: json['createdDate'] as String?,
      userCode: json['userCode'] as String?,
      userName: json['userName'] as String?,
      fullName: json['fullName'] as String?,
      userType: json['userType'] as String?,
      status: json['status'] as int?,
      refOwnerId: json['refOwnerId'] as String?,
      roles: (json['roles'] as List<dynamic>?)?.map(Role.fromJson).toList(),
      farmingCycleId: json['farmingCycleId'] as String?,
      ownerId: json['ownerId'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('username', instance.username);
  writeNotNull('password', instance.password);
  writeNotNull('oldPassword', instance.oldPassword);
  writeNotNull('newPassword', instance.newPassword);
  writeNotNull('confirmationPassword', instance.confirmationPassword);
  writeNotNull('cmsId', instance.cmsId);
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('waNumber', instance.waNumber);
  writeNotNull('role', instance.role);
  writeNotNull('organizationId', instance.organizationId);
  writeNotNull('organizationName', instance.organizationName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('userCode', instance.userCode);
  writeNotNull('userName', instance.userName);
  writeNotNull('fullName', instance.fullName);
  writeNotNull('userType', instance.userType);
  writeNotNull('status', instance.status);
  writeNotNull('refOwnerId', instance.refOwnerId);
  writeNotNull('roles', instance.roles);
  writeNotNull('farmingCycleId', instance.farmingCycleId);
  writeNotNull('ownerId', instance.ownerId);
  return val;
}
