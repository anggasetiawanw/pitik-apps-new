import 'package:freezed_annotation/freezed_annotation.dart';

part 'chick_type_model.freezed.dart';
part 'chick_type_model.g.dart';

@freezed
class ChickType with _$ChickType {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory ChickType({
    String? id,
    String? chickTypeName,
    String? category,
  }) = _ChickType;

  factory ChickType.fromJson(Map<String, dynamic> json) => _$ChickTypeFromJson(json);
}
