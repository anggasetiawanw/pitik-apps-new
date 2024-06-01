// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coop_standart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoopActiveStandardImpl _$$CoopActiveStandardImplFromJson(
        Map<String, dynamic> json) =>
    _$CoopActiveStandardImpl(
      day: json['day'] as int?,
      actual: (json['actual'] as num?)?.toDouble(),
      standard: (json['standard'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CoopActiveStandardImplToJson(
    _$CoopActiveStandardImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('day', instance.day);
  writeNotNull('actual', instance.actual);
  writeNotNull('standard', instance.standard);
  return val;
}
