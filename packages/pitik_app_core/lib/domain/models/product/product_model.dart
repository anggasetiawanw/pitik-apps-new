import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pitik_app_core/domain/models/category/category_model.dart';
import 'package:pitik_app_core/domain/models/media_upload/media_upload_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory Product({
    String? id,
    String? feedStockSummaryId,
    String? ovkStockSummaryId,
    String? categoryCode,
    String? categoryName,
    String? subcategoryCode,
    String? subcategoryName,
    String? productCode,
    String? productName,
    double? quantity,
    String? purchaseUom,
    String? uom,
    String? statusText,
    String? coopSourceName,
    int? status,
    int? remaining,
    String? deliveryDate,
    String? coopTargetName,
    String? poProductId,
    String? notes,
    String? logisticOption,
    String? farmingCycleId,
    double? remainingQuantity,
    bool? isReturned,
    String? remarks,
    String? name,
    int? dailyQuantity,
    double? price,
    double? value,
    String? categoryId,
    double? weight,
    String? productItemId,
    String? productCategoryId,
    String? quantityUOM,
    String? weightUOM,
    int? numberOfCuts,
    int? returnQuantity,
    double? returnWeight,
    double? minValue,
    double? maxValue,
    double? totalWeight,
    int? totalQuantity,
    String? cutType,
    int? previousQuantity,
    double? previousWeight,
    int? lossPrecentage,
    CategoryModel? category,
    CategoryModel? productCategory,
    Product? productItem,
    List<Product?>? productItems,
    List<MediaUploadModel?>? photos,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
