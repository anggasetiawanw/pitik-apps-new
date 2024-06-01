// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String?,
      feedStockSummaryId: json['feedStockSummaryId'] as String?,
      ovkStockSummaryId: json['ovkStockSummaryId'] as String?,
      categoryCode: json['categoryCode'] as String?,
      categoryName: json['categoryName'] as String?,
      subcategoryCode: json['subcategoryCode'] as String?,
      subcategoryName: json['subcategoryName'] as String?,
      productCode: json['productCode'] as String?,
      productName: json['productName'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      purchaseUom: json['purchaseUom'] as String?,
      uom: json['uom'] as String?,
      statusText: json['statusText'] as String?,
      coopSourceName: json['coopSourceName'] as String?,
      status: json['status'] as int?,
      remaining: json['remaining'] as int?,
      deliveryDate: json['deliveryDate'] as String?,
      coopTargetName: json['coopTargetName'] as String?,
      poProductId: json['poProductId'] as String?,
      notes: json['notes'] as String?,
      logisticOption: json['logisticOption'] as String?,
      farmingCycleId: json['farmingCycleId'] as String?,
      remainingQuantity: (json['remainingQuantity'] as num?)?.toDouble(),
      isReturned: json['isReturned'] as bool?,
      remarks: json['remarks'] as String?,
      name: json['name'] as String?,
      dailyQuantity: json['dailyQuantity'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      value: (json['value'] as num?)?.toDouble(),
      categoryId: json['categoryId'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      productItemId: json['productItemId'] as String?,
      productCategoryId: json['productCategoryId'] as String?,
      quantityUOM: json['quantityUOM'] as String?,
      weightUOM: json['weightUOM'] as String?,
      numberOfCuts: json['numberOfCuts'] as int?,
      returnQuantity: json['returnQuantity'] as int?,
      returnWeight: (json['returnWeight'] as num?)?.toDouble(),
      minValue: (json['minValue'] as num?)?.toDouble(),
      maxValue: (json['maxValue'] as num?)?.toDouble(),
      totalWeight: (json['totalWeight'] as num?)?.toDouble(),
      totalQuantity: json['totalQuantity'] as int?,
      cutType: json['cutType'] as String?,
      previousQuantity: json['previousQuantity'] as int?,
      previousWeight: (json['previousWeight'] as num?)?.toDouble(),
      lossPrecentage: json['lossPrecentage'] as int?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      productCategory: json['productCategory'] == null
          ? null
          : CategoryModel.fromJson(
              json['productCategory'] as Map<String, dynamic>),
      productItem: json['productItem'] == null
          ? null
          : Product.fromJson(json['productItem'] as Map<String, dynamic>),
      productItems: (json['productItems'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MediaUploadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('feedStockSummaryId', instance.feedStockSummaryId);
  writeNotNull('ovkStockSummaryId', instance.ovkStockSummaryId);
  writeNotNull('categoryCode', instance.categoryCode);
  writeNotNull('categoryName', instance.categoryName);
  writeNotNull('subcategoryCode', instance.subcategoryCode);
  writeNotNull('subcategoryName', instance.subcategoryName);
  writeNotNull('productCode', instance.productCode);
  writeNotNull('productName', instance.productName);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('purchaseUom', instance.purchaseUom);
  writeNotNull('uom', instance.uom);
  writeNotNull('statusText', instance.statusText);
  writeNotNull('coopSourceName', instance.coopSourceName);
  writeNotNull('status', instance.status);
  writeNotNull('remaining', instance.remaining);
  writeNotNull('deliveryDate', instance.deliveryDate);
  writeNotNull('coopTargetName', instance.coopTargetName);
  writeNotNull('poProductId', instance.poProductId);
  writeNotNull('notes', instance.notes);
  writeNotNull('logisticOption', instance.logisticOption);
  writeNotNull('farmingCycleId', instance.farmingCycleId);
  writeNotNull('remainingQuantity', instance.remainingQuantity);
  writeNotNull('isReturned', instance.isReturned);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('name', instance.name);
  writeNotNull('dailyQuantity', instance.dailyQuantity);
  writeNotNull('price', instance.price);
  writeNotNull('value', instance.value);
  writeNotNull('categoryId', instance.categoryId);
  writeNotNull('weight', instance.weight);
  writeNotNull('productItemId', instance.productItemId);
  writeNotNull('productCategoryId', instance.productCategoryId);
  writeNotNull('quantityUOM', instance.quantityUOM);
  writeNotNull('weightUOM', instance.weightUOM);
  writeNotNull('numberOfCuts', instance.numberOfCuts);
  writeNotNull('returnQuantity', instance.returnQuantity);
  writeNotNull('returnWeight', instance.returnWeight);
  writeNotNull('minValue', instance.minValue);
  writeNotNull('maxValue', instance.maxValue);
  writeNotNull('totalWeight', instance.totalWeight);
  writeNotNull('totalQuantity', instance.totalQuantity);
  writeNotNull('cutType', instance.cutType);
  writeNotNull('previousQuantity', instance.previousQuantity);
  writeNotNull('previousWeight', instance.previousWeight);
  writeNotNull('lossPrecentage', instance.lossPrecentage);
  writeNotNull('category', instance.category);
  writeNotNull('productCategory', instance.productCategory);
  writeNotNull('productItem', instance.productItem);
  writeNotNull('productItems', instance.productItems);
  writeNotNull('photos', instance.photos);
  return val;
}
