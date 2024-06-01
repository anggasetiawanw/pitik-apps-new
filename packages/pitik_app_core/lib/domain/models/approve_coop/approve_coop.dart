import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_coop.freezed.dart';
part 'approve_coop.g.dart';

@freezed
class ApproveCoop with _$ApproveCoop {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory ApproveCoop({
    String? id,
    String? farmingCycleId,
    bool? isApproved,
  }) = _ApproveCoop;

  factory ApproveCoop.fromJson(Map<String, dynamic> json) => _$ApproveCoopFromJson(json);
}
