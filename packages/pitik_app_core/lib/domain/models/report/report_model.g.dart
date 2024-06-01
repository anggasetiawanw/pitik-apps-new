// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportImpl _$$ReportImplFromJson(Map<String, dynamic> json) => _$ReportImpl(
      taskTicketId: json['taskTicketId'] as String?,
      title: json['title'] as String?,
      deskripsi: json['deskripsi'] as String?,
      status: json['status'] as String?,
      date: json['date'] as String?,
      averageWeight: (json['averageWeight'] as num?)?.toDouble(),
      mortality: json['mortality'] as int?,
      culling: json['culling'] as int?,
      feedQuantity: (json['feedQuantity'] as num?)?.toDouble(),
      feedTypeCode: json['feedTypeCode'] as String?,
      feedAdditionalInfo: json['feedAdditionalInfo'] as String?,
      mortalityImage: json['mortalityImage'] as String?,
      recordingImage: json['recordingImage'] as String?,
      summary: json['summary'] as String?,
      remarks: json['remarks'] as String?,
      isAbnormal: json['isAbnormal'] as bool?,
      revisionStatus: json['revisionStatus'] as String?,
      eggDisposal: (json['eggDisposal'] as num?)?.toDouble(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MediaUploadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      feedConsumptions: (json['feedConsumptions'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      ovkConsumptions: (json['ovkConsumptions'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      mortalityList: (json['mortalityList'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MortalityReason.fromJson(e as Map<String, dynamic>))
          .toList(),
      harvestedEgg: (json['harvestedEgg'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReportImplToJson(_$ReportImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('taskTicketId', instance.taskTicketId);
  writeNotNull('title', instance.title);
  writeNotNull('deskripsi', instance.deskripsi);
  writeNotNull('status', instance.status);
  writeNotNull('date', instance.date);
  writeNotNull('averageWeight', instance.averageWeight);
  writeNotNull('mortality', instance.mortality);
  writeNotNull('culling', instance.culling);
  writeNotNull('feedQuantity', instance.feedQuantity);
  writeNotNull('feedTypeCode', instance.feedTypeCode);
  writeNotNull('feedAdditionalInfo', instance.feedAdditionalInfo);
  writeNotNull('mortalityImage', instance.mortalityImage);
  writeNotNull('recordingImage', instance.recordingImage);
  writeNotNull('summary', instance.summary);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('isAbnormal', instance.isAbnormal);
  writeNotNull('revisionStatus', instance.revisionStatus);
  writeNotNull('eggDisposal', instance.eggDisposal);
  writeNotNull('images', instance.images);
  writeNotNull('feedConsumptions', instance.feedConsumptions);
  writeNotNull('ovkConsumptions', instance.ovkConsumptions);
  writeNotNull('mortalityList', instance.mortalityList);
  writeNotNull('harvestedEgg', instance.harvestedEgg);
  return val;
}
