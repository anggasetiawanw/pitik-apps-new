// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coop_performance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoopPerformanceImpl _$$CoopPerformanceImplFromJson(
        Map<String, dynamic> json) =>
    _$CoopPerformanceImpl(
      farmingCycleId: json['farmingCycleId'] as String?,
      taskTicketId: json['taskTicketId'] as String?,
      date: json['date'] as String?,
      day: json['day'] as int?,
      bw: json['bw'] == null
          ? null
          : CoopActiveStandard.fromJson(json['bw'] as Map<String, dynamic>),
      adg: json['adg'] == null
          ? null
          : CoopActiveStandard.fromJson(json['adg'] as Map<String, dynamic>),
      ip: json['ip'] == null
          ? null
          : CoopActiveStandard.fromJson(json['ip'] as Map<String, dynamic>),
      fcr: json['fcr'] == null
          ? null
          : CoopActiveStandard.fromJson(json['fcr'] as Map<String, dynamic>),
      mortality: json['mortality'] == null
          ? null
          : CoopActiveStandard.fromJson(
              json['mortality'] as Map<String, dynamic>),
      hdp: json['hdp'] == null
          ? null
          : CoopActiveStandard.fromJson(json['hdp'] as Map<String, dynamic>),
      eggMass: json['eggMass'] == null
          ? null
          : CoopActiveStandard.fromJson(
              json['eggMass'] as Map<String, dynamic>),
      eggWeight: json['eggWeight'] == null
          ? null
          : CoopActiveStandard.fromJson(
              json['eggWeight'] as Map<String, dynamic>),
      feedIntake: json['feedIntake'] == null
          ? null
          : CoopActiveStandard.fromJson(
              json['feedIntake'] as Map<String, dynamic>),
      population: json['population'] == null
          ? null
          : Population.fromJson(json['population'] as Map<String, dynamic>),
      feed: json['feed'] == null
          ? null
          : Consumption.fromJson(json['feed'] as Map<String, dynamic>),
      ovk: json['ovk'] == null
          ? null
          : Consumption.fromJson(json['ovk'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CoopPerformanceImplToJson(
    _$CoopPerformanceImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('farmingCycleId', instance.farmingCycleId);
  writeNotNull('taskTicketId', instance.taskTicketId);
  writeNotNull('date', instance.date);
  writeNotNull('day', instance.day);
  writeNotNull('bw', instance.bw);
  writeNotNull('adg', instance.adg);
  writeNotNull('ip', instance.ip);
  writeNotNull('fcr', instance.fcr);
  writeNotNull('mortality', instance.mortality);
  writeNotNull('hdp', instance.hdp);
  writeNotNull('eggMass', instance.eggMass);
  writeNotNull('eggWeight', instance.eggWeight);
  writeNotNull('feedIntake', instance.feedIntake);
  writeNotNull('population', instance.population);
  writeNotNull('feed', instance.feed);
  writeNotNull('ovk', instance.ovk);
  return val;
}
