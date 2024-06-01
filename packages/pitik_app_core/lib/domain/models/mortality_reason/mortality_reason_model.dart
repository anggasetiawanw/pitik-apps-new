import 'package:freezed_annotation/freezed_annotation.dart';

part 'mortality_reason_model.freezed.dart';
part 'mortality_reason_model.g.dart';

@freezed
class MortalityReason with _$MortalityReason {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
 const  factory MortalityReason({
    int? quantity,
    String? cause,
  }) = _MortalityReason;

  factory MortalityReason.fromJson(Map<String, dynamic> json) => _$MortalityReasonFromJson(json);
}
