import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pitik_app_core/domain/models/media_upload/media_upload_model.dart';
import 'package:pitik_app_core/domain/models/product/product_model.dart';

part 'good_receipt._model.freezed.dart';
part 'good_receipt._model.g.dart';

@freezed
class GoodReceipt with _$GoodReceipt {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory GoodReceipt({
    String? receivedDate,
    String? remarks,
    List<Product?>? details,
    List<MediaUploadModel?>? photos,
  }) = _GoodReceipt;

  factory GoodReceipt.fromJson(Map<String, dynamic> json) => _$GoodReceiptFromJson(json);
}
