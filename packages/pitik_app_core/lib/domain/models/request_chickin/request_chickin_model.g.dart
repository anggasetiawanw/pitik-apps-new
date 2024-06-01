// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_chickin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestChickinImpl _$$RequestChickinImplFromJson(Map<String, dynamic> json) =>
    _$RequestChickinImpl(
      id: json['id'] as String?,
      poCode: json['poCode'] as String?,
      erpCode: json['erpCode'] as String?,
      startDate: json['startDate'] as String?,
      chickInDate: json['chickInDate'] as String?,
      initialPopulation: json['initialPopulation'] as int?,
      bw: json['bw'] as int?,
      uniformity: json['uniformity'] as int?,
      additionalPopulation: json['additionalPopulation'] as int?,
      truckArrival: json['truckArrival'] as String?,
      truckLeaving: json['truckLeaving'] as String?,
      finishChickIn: json['finishChickIn'] as String?,
      recordStart: json['recordStart'] as String?,
      remarks: json['remarks'] as String?,
      coopId: json['coopId'] as String?,
      hasFinishedDOCin: json['hasFinishedDOCin'] as bool?,
      pulletInWeeks: json['pulletInWeeks'] as int?,
      doc: json['doc'] == null
          ? null
          : Product.fromJson(json['doc'] as Map<String, dynamic>),
      pakan: (json['pakan'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      ovk: (json['ovk'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      internalOvkTransferRequest: json['internalOvkTransferRequest'] == null
          ? null
          : Procurement.fromJson(
              json['internalOvkTransferRequest'] as Map<String, dynamic>),
      chickType: json['chickType'] == null
          ? null
          : ChickType.fromJson(json['chickType'] as Map<String, dynamic>),
      suratJalanPhotos: (json['suratJalanPhotos'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MediaUploadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      docInFormPhotos: (json['docInFormPhotos'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MediaUploadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pulletInFormPhotos: (json['pulletInFormPhotos'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MediaUploadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MediaUploadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
      mergedLogistic: json['mergedLogistic'] as bool?,
      mergedCoopId: json['mergedCoopId'] as String?,
      mergedLogisticCoopName: json['mergedLogisticCoopName'] as String?,
      mergedLogisticFarmingCycleDays:
          json['mergedLogisticFarmingCycleDays'] as int?,
    );

Map<String, dynamic> _$$RequestChickinImplToJson(
    _$RequestChickinImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('poCode', instance.poCode);
  writeNotNull('erpCode', instance.erpCode);
  writeNotNull('startDate', instance.startDate);
  writeNotNull('chickInDate', instance.chickInDate);
  writeNotNull('initialPopulation', instance.initialPopulation);
  writeNotNull('bw', instance.bw);
  writeNotNull('uniformity', instance.uniformity);
  writeNotNull('additionalPopulation', instance.additionalPopulation);
  writeNotNull('truckArrival', instance.truckArrival);
  writeNotNull('truckLeaving', instance.truckLeaving);
  writeNotNull('finishChickIn', instance.finishChickIn);
  writeNotNull('recordStart', instance.recordStart);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('coopId', instance.coopId);
  writeNotNull('hasFinishedDOCin', instance.hasFinishedDOCin);
  writeNotNull('pulletInWeeks', instance.pulletInWeeks);
  writeNotNull('doc', instance.doc);
  writeNotNull('pakan', instance.pakan);
  writeNotNull('ovk', instance.ovk);
  writeNotNull(
      'internalOvkTransferRequest', instance.internalOvkTransferRequest);
  writeNotNull('chickType', instance.chickType);
  writeNotNull('suratJalanPhotos', instance.suratJalanPhotos);
  writeNotNull('docInFormPhotos', instance.docInFormPhotos);
  writeNotNull('pulletInFormPhotos', instance.pulletInFormPhotos);
  writeNotNull('photos', instance.photos);
  writeNotNull('notes', instance.notes);
  writeNotNull('mergedLogistic', instance.mergedLogistic);
  writeNotNull('mergedCoopId', instance.mergedCoopId);
  writeNotNull('mergedLogisticCoopName', instance.mergedLogisticCoopName);
  writeNotNull('mergedLogisticFarmingCycleDays',
      instance.mergedLogisticFarmingCycleDays);
  return val;
}
