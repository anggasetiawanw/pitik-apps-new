// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procurement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcurementImpl _$$ProcurementImplFromJson(Map<String, dynamic> json) =>
    _$ProcurementImpl(
      id: json['id'] as String?,
      poCode: json['poCode'] as String?,
      purchaseRequestErpCode: json['purchaseRequestErpCode'] as String?,
      type: json['type'] as String?,
      deliveryDate: json['deliveryDate'] as String?,
      status: json['status'] as int?,
      statusText: json['statusText'] as String?,
      farmingCycleId: json['farmingCycleId'] as String?,
      requestSchedule: json['requestSchedule'] as String?,
      erpCode: json['erpCode'] as String?,
      arrivalDate: json['arrivalDate'] as String?,
      description: json['description'] as String?,
      isFulfilled: json['isFulfilled'] as bool?,
      notes: json['notes'] as String?,
      coopTargetName: json['coopTargetName'] as String?,
      coopSourceName: json['coopSourceName'] as String?,
      branchSourceName: json['branchSourceName'] as String?,
      branchTargetName: json['branchTargetName'] as String?,
      coopId: json['coopId'] as String?,
      coopSourceId: json['coopSourceId'] as String?,
      coopTargetId: json['coopTargetId'] as String?,
      branchSourceId: json['branchSourceId'] as String?,
      branchTargetId: json['branchTargetId'] as String?,
      subcategoryCode: json['subcategoryCode'] as String?,
      subcategoryName: json['subcategoryName'] as String?,
      uom: json['uom'] as String?,
      productName: json['productName'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      datePlanned: json['datePlanned'] as String?,
      internalOvkTransferRequestId:
          json['internalOvkTransferRequestId'] as String?,
      logisticOption: json['logisticOption'] as String?,
      route: json['route'] as String?,
      mergedLogistic: json['mergedLogistic'] as bool?,
      mergedCoopId: json['mergedCoopId'] as String?,
      mergedLogisticCoopName: json['mergedLogisticCoopName'] as String?,
      mergedLogisticFarmingCycleDays:
          json['mergedLogisticFarmingCycleDays'] as int?,
      isTransferRequest: json['isTransferRequest'] as bool?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      goodsReceipts: (json['goodsReceipts'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GoodReceipt.fromJson(e as Map<String, dynamic>))
          .toList(),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MediaUploadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      internalOvkTransferRequest: json['internalOvkTransferRequest'] == null
          ? null
          : Procurement.fromJson(
              json['internalOvkTransferRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProcurementImplToJson(_$ProcurementImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('poCode', instance.poCode);
  writeNotNull('purchaseRequestErpCode', instance.purchaseRequestErpCode);
  writeNotNull('type', instance.type);
  writeNotNull('deliveryDate', instance.deliveryDate);
  writeNotNull('status', instance.status);
  writeNotNull('statusText', instance.statusText);
  writeNotNull('farmingCycleId', instance.farmingCycleId);
  writeNotNull('requestSchedule', instance.requestSchedule);
  writeNotNull('erpCode', instance.erpCode);
  writeNotNull('arrivalDate', instance.arrivalDate);
  writeNotNull('description', instance.description);
  writeNotNull('isFulfilled', instance.isFulfilled);
  writeNotNull('notes', instance.notes);
  writeNotNull('coopTargetName', instance.coopTargetName);
  writeNotNull('coopSourceName', instance.coopSourceName);
  writeNotNull('branchSourceName', instance.branchSourceName);
  writeNotNull('branchTargetName', instance.branchTargetName);
  writeNotNull('coopId', instance.coopId);
  writeNotNull('coopSourceId', instance.coopSourceId);
  writeNotNull('coopTargetId', instance.coopTargetId);
  writeNotNull('branchSourceId', instance.branchSourceId);
  writeNotNull('branchTargetId', instance.branchTargetId);
  writeNotNull('subcategoryCode', instance.subcategoryCode);
  writeNotNull('subcategoryName', instance.subcategoryName);
  writeNotNull('uom', instance.uom);
  writeNotNull('productName', instance.productName);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('datePlanned', instance.datePlanned);
  writeNotNull(
      'internalOvkTransferRequestId', instance.internalOvkTransferRequestId);
  writeNotNull('logisticOption', instance.logisticOption);
  writeNotNull('route', instance.route);
  writeNotNull('mergedLogistic', instance.mergedLogistic);
  writeNotNull('mergedCoopId', instance.mergedCoopId);
  writeNotNull('mergedLogisticCoopName', instance.mergedLogisticCoopName);
  writeNotNull('mergedLogisticFarmingCycleDays',
      instance.mergedLogisticFarmingCycleDays);
  writeNotNull('isTransferRequest', instance.isTransferRequest);
  writeNotNull('details', instance.details);
  writeNotNull('goodsReceipts', instance.goodsReceipts);
  writeNotNull('photos', instance.photos);
  writeNotNull(
      'internalOvkTransferRequest', instance.internalOvkTransferRequest);
  return val;
}
