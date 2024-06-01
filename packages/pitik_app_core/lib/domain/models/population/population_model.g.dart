// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'population_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PopulationImpl _$$PopulationImplFromJson(Map<String, dynamic> json) =>
    _$PopulationImpl(
      total: json['total'] as int?,
      mortaled: json['mortaled'] as int?,
      mortality: json['mortality'] as int?,
      harvested: json['harvested'] as int?,
      remaining: json['remaining'] as int?,
      feedConsumed: json['feedConsumed'] as int?,
      culled: json['culled'] as int?,
      initialPopulation: json['initialPopulation'] as int?,
    );

Map<String, dynamic> _$$PopulationImplToJson(_$PopulationImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('total', instance.total);
  writeNotNull('mortaled', instance.mortaled);
  writeNotNull('mortality', instance.mortality);
  writeNotNull('harvested', instance.harvested);
  writeNotNull('remaining', instance.remaining);
  writeNotNull('feedConsumed', instance.feedConsumed);
  writeNotNull('culled', instance.culled);
  writeNotNull('initialPopulation', instance.initialPopulation);
  return val;
}
