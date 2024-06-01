// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthImpl _$$AuthImplFromJson(Map<String, dynamic> json) => _$AuthImpl(
      id: json['id'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      acceptTnc: json['acceptTnc'] as int?,
      action: json['action'] as String?,
    );

Map<String, dynamic> _$$AuthImplToJson(_$AuthImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('token', instance.token);
  writeNotNull('refreshToken', instance.refreshToken);
  writeNotNull('acceptTnc', instance.acceptTnc);
  writeNotNull('action', instance.action);
  return val;
}
