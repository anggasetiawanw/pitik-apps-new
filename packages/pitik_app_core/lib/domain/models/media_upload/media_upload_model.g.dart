// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaUploadModelImpl _$$MediaUploadModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaUploadModelImpl(
      id: json['id'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$MediaUploadModelImplToJson(
    _$MediaUploadModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('url', instance.url);
  return val;
}
