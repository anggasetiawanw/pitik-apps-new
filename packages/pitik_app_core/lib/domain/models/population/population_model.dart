import 'package:freezed_annotation/freezed_annotation.dart';

part 'population_model.freezed.dart';
part 'population_model.g.dart';

@freezed
class Population with _$Population {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory Population({
    int? total,
    int? mortaled,
    int? mortality,
    int? harvested,
    int? remaining,
    int? feedConsumed,
    int? culled,
    int? initialPopulation,
  }) = _Population;

  factory Population.fromJson(Map<String, dynamic> json) => _$PopulationFromJson(json);
}
