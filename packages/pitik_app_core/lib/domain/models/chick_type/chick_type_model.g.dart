// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chick_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChickTypeImpl _$$ChickTypeImplFromJson(Map<String, dynamic> json) =>
    _$ChickTypeImpl(
      id: json['id'] as String?,
      chickTypeName: json['chickTypeName'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$ChickTypeImplToJson(_$ChickTypeImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('chickTypeName', instance.chickTypeName);
  writeNotNull('category', instance.category);
  return val;
}
