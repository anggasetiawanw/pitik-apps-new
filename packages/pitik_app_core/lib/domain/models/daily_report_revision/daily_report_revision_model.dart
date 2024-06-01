import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_report_revision_model.freezed.dart';
part 'daily_report_revision_model.g.dart';

@freezed
class DailyReportRevision with _$DailyReportRevision {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory DailyReportRevision({
    String? reason,
    List<String?>? changes,
  }) = _DailyReportRevision;

  factory DailyReportRevision.fromJson(Map<String, dynamic> json) => _$DailyReportRevisionFromJson(json);
}
