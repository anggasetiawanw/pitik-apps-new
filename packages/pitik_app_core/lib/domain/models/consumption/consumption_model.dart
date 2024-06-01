import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumption_model.freezed.dart';
part 'consumption_model.g.dart';

@freezed
class Consumption with _$Consumption {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory Consumption({
    double? remaining,
    String? estimation,
    String? stockoutDate,
    double? consumption,
  }) = _Consumption;

  factory Consumption.fromJson(Map<String, dynamic> json) => _$ConsumptionFromJson(json);
}
