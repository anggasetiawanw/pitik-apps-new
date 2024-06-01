// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonitoringImpl _$$MonitoringImplFromJson(Map<String, dynamic> json) =>
    _$MonitoringImpl(
      day: json['day'] as int?,
      chickenAge: json['chickenAge'] as int?,
      coopName: json['coopName'] as String?,
      period: json['period'] as int?,
      currentTemperature: json['currentTemperature'] as int?,
      averageChickenAge: (json['averageChickenAge'] as num?)?.toDouble(),
      chickInDate: json['chickInDate'] as String?,
      performance: json['performance'] == null
          ? null
          : CoopPerformance.fromJson(
              json['performance'] as Map<String, dynamic>),
      population: json['population'] == null
          ? null
          : Population.fromJson(json['population'] as Map<String, dynamic>),
      feed: json['feed'] == null
          ? null
          : Consumption.fromJson(json['feed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MonitoringImplToJson(_$MonitoringImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('day', instance.day);
  writeNotNull('chickenAge', instance.chickenAge);
  writeNotNull('coopName', instance.coopName);
  writeNotNull('period', instance.period);
  writeNotNull('currentTemperature', instance.currentTemperature);
  writeNotNull('averageChickenAge', instance.averageChickenAge);
  writeNotNull('chickInDate', instance.chickInDate);
  writeNotNull('performance', instance.performance);
  writeNotNull('population', instance.population);
  writeNotNull('feed', instance.feed);
  return val;
}
