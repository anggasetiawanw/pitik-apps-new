import 'package:freezed_annotation/freezed_annotation.dart';

part 'coop_standart.freezed.dart';
part 'coop_standart.g.dart';

@freezed
class CoopActiveStandard with _$CoopActiveStandard {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory CoopActiveStandard({
    int? day,
    double? actual,
    double? standard,
  }) = _CoopActiveStandard;

  factory CoopActiveStandard.fromJson(Map<String, dynamic> json) => _$CoopActiveStandardFromJson(json);
}
