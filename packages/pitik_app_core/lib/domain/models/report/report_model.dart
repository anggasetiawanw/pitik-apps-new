import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pitik_app_core/domain/models/media_upload/media_upload_model.dart';
import 'package:pitik_app_core/domain/models/mortality_reason/mortality_reason_model.dart';
import 'package:pitik_app_core/domain/models/product/product_model.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
class Report with _$Report {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory Report({
    String? taskTicketId,
    String? title,
    String? deskripsi,
    String? status,
    String? date,
    double? averageWeight,
    int? mortality,
    int? culling,
    double? feedQuantity,
    String? feedTypeCode,
    String? feedAdditionalInfo,
    String? mortalityImage,
    String? recordingImage,
    String? summary,
    String? remarks,
    bool? isAbnormal,
    String? revisionStatus,
    double? eggDisposal,
    List<MediaUploadModel?>? images,
    List<Product?>? feedConsumptions,
    List<Product?>? ovkConsumptions,
    List<MortalityReason?>? mortalityList,
    List<Product?>? harvestedEgg,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}
