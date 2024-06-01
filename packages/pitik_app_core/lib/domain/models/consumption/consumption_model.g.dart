// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsumptionImpl _$$ConsumptionImplFromJson(Map<String, dynamic> json) =>
    _$ConsumptionImpl(
      remaining: (json['remaining'] as num?)?.toDouble(),
      estimation: json['estimation'] as String?,
      stockoutDate: json['stockoutDate'] as String?,
      consumption: (json['consumption'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ConsumptionImplToJson(_$ConsumptionImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('remaining', instance.remaining);
  writeNotNull('estimation', instance.estimation);
  writeNotNull('stockoutDate', instance.stockoutDate);
  writeNotNull('consumption', instance.consumption);
  return val;
}
