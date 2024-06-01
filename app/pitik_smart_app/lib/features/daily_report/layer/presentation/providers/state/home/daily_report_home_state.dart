import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

enum EnumDailyReportHomeState {
  initial,
  loading,
  loaded,
  error,
}

class DailyReportHomeState extends Equatable {
  final EnumDailyReportHomeState state;
  final List<Report> listReport;
  final String message;

  const DailyReportHomeState({
    this.state = EnumDailyReportHomeState.initial,
    this.listReport = const [],
    this.message = '',
  });

  const DailyReportHomeState.initial({
    this.state = EnumDailyReportHomeState.initial,
    this.listReport = const [],
    this.message = '',
  });

  DailyReportHomeState copyWith({
    EnumDailyReportHomeState? state,
    List<Report>? listReport,
    String? message,
  }) {
    return DailyReportHomeState(
      state: state ?? this.state,
      listReport: listReport ?? this.listReport,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [state, listReport, message,];
}
