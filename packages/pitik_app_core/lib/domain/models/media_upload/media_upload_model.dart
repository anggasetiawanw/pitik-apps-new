import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_upload_model.freezed.dart';
part 'media_upload_model.g.dart';

@freezed
class MediaUploadModel with _$MediaUploadModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory MediaUploadModel({
    String? id,
    String? url,
  }) = _MediaUploadModel;

  factory MediaUploadModel.fromJson(Map<String, dynamic> json) => _$MediaUploadModelFromJson(json);
}
