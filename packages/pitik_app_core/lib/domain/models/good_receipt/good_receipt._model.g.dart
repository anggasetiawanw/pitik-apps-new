// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_receipt._model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoodReceiptImpl _$$GoodReceiptImplFromJson(Map<String, dynamic> json) =>
    _$GoodReceiptImpl(
      receivedDate: json['receivedDate'] as String?,
      remarks: json['remarks'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MediaUploadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GoodReceiptImplToJson(_$GoodReceiptImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('receivedDate', instance.receivedDate);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('details', instance.details);
  writeNotNull('photos', instance.photos);
  return val;
}
