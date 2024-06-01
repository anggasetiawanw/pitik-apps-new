import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pitik_app_core/domain/models/consumption/consumption_model.dart';
import 'package:pitik_app_core/domain/models/coop_standart/coop_standart.dart';
import 'package:pitik_app_core/domain/models/population/population_model.dart';

part 'coop_performance_model.freezed.dart';
part 'coop_performance_model.g.dart';

@freezed
class CoopPerformance with _$CoopPerformance {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory CoopPerformance({
    String? farmingCycleId,
    String? taskTicketId,
    String? date,
    int? day,
    CoopActiveStandard? bw,
    CoopActiveStandard? adg,
    CoopActiveStandard? ip,
    CoopActiveStandard? fcr,
    CoopActiveStandard? mortality,
    CoopActiveStandard? hdp,
    CoopActiveStandard? eggMass,
    CoopActiveStandard? eggWeight,
    CoopActiveStandard? feedIntake,
    Population? population,
    Consumption? feed,
    Consumption? ovk,
  }) = _CoopPerformance;

  factory CoopPerformance.fromJson(Map<String, dynamic> json) => _$CoopPerformanceFromJson(json);
}
