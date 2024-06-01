import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pitik_app_core/domain/models/consumption/consumption_model.dart';
import 'package:pitik_app_core/domain/models/coop_performance/coop_performance_model.dart';
import 'package:pitik_app_core/domain/models/population/population_model.dart';

part 'monitoring_model.freezed.dart';
part 'monitoring_model.g.dart';

@freezed
class Monitoring with _$Monitoring {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory Monitoring({
    int? day,
    int? chickenAge,
    String? coopName,
    int? period,
    int? currentTemperature,
    double? averageChickenAge,
    String? chickInDate,
    CoopPerformance? performance,
    Population? population,
    Consumption? feed,
  }) = _Monitoring;

  factory Monitoring.fromJson(Map<String, dynamic> json) => _$MonitoringFromJson(json);
}
