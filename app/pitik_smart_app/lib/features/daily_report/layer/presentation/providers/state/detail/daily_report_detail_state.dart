import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

enum EnumDailyReportDetail { initial, loading, loaded, error }

class DailyReportDetailState extends Equatable {
  final EnumDailyReportDetail state;
  final String message;
  final Report report;
  final bool isCanRevision;
  final bool isCanEdit;

  const DailyReportDetailState({
    this.state = EnumDailyReportDetail.initial,
    this.message = '',
    this.report = const Report(),
    this.isCanRevision = true,
    this.isCanEdit = true,
  });

  const DailyReportDetailState.inital({
    this.state = EnumDailyReportDetail.initial,
    this.isCanRevision = true,
    this.message = '',
    this.report = const Report(),
    this.isCanEdit = true,
  });

  DailyReportDetailState copyWith({
    EnumDailyReportDetail? state,
    String? message,
    Report? report,
    bool? isCanRevision,
    bool? isCanEdit,
  }) {
    return DailyReportDetailState(
      state: state ?? this.state,
      message: message ?? this.message,
      report: report ?? this.report,
      isCanRevision: isCanRevision ?? this.isCanRevision,
      isCanEdit: isCanEdit ?? this.isCanEdit,
    );
  }

  @override
  String toString() {
    return 'DailyReportDetailState(state: $state, message: $message, report: $report, isCanRevision: $isCanRevision, isCanEdit: $isCanEdit)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [state, message, report, isCanRevision, isCanEdit];
}
