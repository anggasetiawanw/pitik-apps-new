import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory CategoryModel({
    String? id,
    String? name,
    double? minValue,
    double? maxValue,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}
