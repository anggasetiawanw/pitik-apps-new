import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pitik_app_core/domain/models/approve_coop/approve_coop.dart';
import 'package:pitik_app_core/domain/models/branch/branch_model.dart';
import 'package:pitik_app_core/domain/models/coop_standart/coop_standart.dart';
import 'package:pitik_app_core/domain/models/room/room.dart';

part 'coop_model.freezed.dart';
part 'coop_model.g.dart';

@freezed
class Coop with _$Coop {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory Coop({
    String? id,
    String? phoneNumber,
    String? name,
    dynamic status,
    String? coopId,
    String? coopCode,
    String? coopName,
    String? coopType,
    String? coopStatus,
    String? farmId,
    String? farmCode,
    String? chickInRequestId,
    String? farmingCycleId,
    String? farmName,
    String? coopDistrict,
    String? coopCity,
    int? period,
    bool? isNew,
    String? startDate,
    String? closedDate,
    bool? hasChickInRequest,
    int? day,
    String? statusText,
    bool? isActionNeeded,
    bool? isOwnFarm,
    int? week,
    String? farmCategory,
    CoopActiveStandard? bw,
    CoopActiveStandard? ip,
    CoopActiveStandard? hdp,
    CoopActiveStandard? feedIntake,
    ApproveCoop? chickInRequest,
    ApproveCoop? purchaseRequestOvk,
    Branch? branch,
    Room? room,
    List<Room?>? rooms,
  }) = _Coop;

  factory Coop.fromJson(Map<String, dynamic> json) => _$CoopFromJson(json);
}
