// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_revision_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyReportRevisionImpl _$$DailyReportRevisionImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyReportRevisionImpl(
      reason: json['reason'] as String?,
      changes: (json['changes'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$$DailyReportRevisionImplToJson(
    _$DailyReportRevisionImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reason', instance.reason);
  writeNotNull('changes', instance.changes);
  return val;
}
