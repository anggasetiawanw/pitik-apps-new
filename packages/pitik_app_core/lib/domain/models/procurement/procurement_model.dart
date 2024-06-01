import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pitik_app_core/domain/models/good_receipt/good_receipt._model.dart';
import 'package:pitik_app_core/domain/models/media_upload/media_upload_model.dart';
import 'package:pitik_app_core/domain/models/product/product_model.dart';

part 'procurement_model.freezed.dart';
part 'procurement_model.g.dart';

@freezed
class Procurement with _$Procurement {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
 const  factory Procurement({
    String? id,
    String? poCode,
    String? purchaseRequestErpCode,
    String? type,
    String? deliveryDate,
    int? status,
    String? statusText,
    String? farmingCycleId,
    String? requestSchedule,
    String? erpCode,
    String? arrivalDate,
    String? description,
    bool? isFulfilled,
    String? notes,
    String? coopTargetName,
    String? coopSourceName,
    String? branchSourceName,
    String? branchTargetName,

    // For Order OVK/Feed
    String? coopId,
    String? coopSourceId,
    String? coopTargetId,
    String? branchSourceId,
    String? branchTargetId,
    String? subcategoryCode,
    String? subcategoryName,
    String? uom,
    String? productName,
    double? quantity,
    String? datePlanned,
    String? internalOvkTransferRequestId,
    String? logisticOption,
    String? route,
    bool? mergedLogistic,
    String? mergedCoopId,
    String? mergedLogisticCoopName,
    int? mergedLogisticFarmingCycleDays,
    bool? isTransferRequest,
    List<Product?>? details,
    List<GoodReceipt?>? goodsReceipts,
    List<MediaUploadModel?>? photos,
    Procurement? internalOvkTransferRequest,
  }) = _Procurement;

  factory Procurement.fromJson(Map<String, dynamic> json) => _$ProcurementFromJson(json);
}
