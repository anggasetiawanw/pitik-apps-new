import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

enum EnumDailyReportRevisionState {
  initial,
  loading,
  loadingPage,
  loaded,
  success,
  error,
  idle,
}

class DailyReportRevisionState extends Equatable {
  final EnumDailyReportRevisionState state;
  final DailyReportRevision dailyReportRevision;
  final String message;
  final int stateReasonRevision;
  final List<String> revisionReasonList;

  const DailyReportRevisionState({
    this.state = EnumDailyReportRevisionState.initial,
    this.dailyReportRevision = const DailyReportRevision(),
    this.message = '',
    this.stateReasonRevision = 0,
    this.revisionReasonList = const [],
  });

  const DailyReportRevisionState.initial({
    this.state = EnumDailyReportRevisionState.initial,
    this.dailyReportRevision = const DailyReportRevision(),
    this.message = '',
    this.stateReasonRevision = 0,
    this.revisionReasonList = const [],
  });

  DailyReportRevisionState copyWith({
    EnumDailyReportRevisionState? state,
    DailyReportRevision? dailyReportRevision,
    String? message,
    int? stateReasonRevision,
    List<String>? revisionReasonList,
  }) {
    return DailyReportRevisionState(
      state: state ?? this.state,
      dailyReportRevision: dailyReportRevision ?? this.dailyReportRevision,
      message: message ?? this.message,
      stateReasonRevision: stateReasonRevision ?? this.stateReasonRevision,
      revisionReasonList: revisionReasonList ?? this.revisionReasonList,
    );
  }

  @override
  List<Object?> get props => [state, dailyReportRevision, message, stateReasonRevision, revisionReasonList];

  @override
  String toString() {
    return 'DailyReportRevisionState{state: $state, dailyReportRevision: $dailyReportRevision, message: $message, stateReasonRevision: $stateReasonRevision, revisionReasonList: $revisionReasonList}';
  }
}
