import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pitik_app_core/domain/models/chick_type/chick_type_model.dart';
import 'package:pitik_app_core/domain/models/media_upload/media_upload_model.dart';
import 'package:pitik_app_core/domain/models/procurement/procurement_model.dart';
import 'package:pitik_app_core/domain/models/product/product_model.dart';

part 'request_chickin_model.freezed.dart';
part 'request_chickin_model.g.dart';

@freezed
class RequestChickin with _$RequestChickin {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory RequestChickin({
    String? id,
    String? poCode,
    String? erpCode,
    String? startDate,
    String? chickInDate,
    int? initialPopulation,
    int? bw,
    int? uniformity,
    int? additionalPopulation,
    String? truckArrival,
    String? truckLeaving,
    String? finishChickIn,
    String? recordStart,
    String? remarks,
    String? coopId,
    bool? hasFinishedDOCin,
    int? pulletInWeeks,
    Product? doc,
    List<Product?>? pakan,
    List<Product?>? ovk,
    Procurement? internalOvkTransferRequest,
    ChickType? chickType,
    List<MediaUploadModel?>? suratJalanPhotos,
    List<MediaUploadModel?>? docInFormPhotos,
    List<MediaUploadModel?>? pulletInFormPhotos,
    List<MediaUploadModel?>? photos,
    String? notes,
    bool? mergedLogistic,
    String? mergedCoopId,
    String? mergedLogisticCoopName,
    int? mergedLogisticFarmingCycleDays,
  }) = _RequestChickin;

  factory RequestChickin.fromJson(Map<String, dynamic> json) => _$RequestChickinFromJson(json);
}
