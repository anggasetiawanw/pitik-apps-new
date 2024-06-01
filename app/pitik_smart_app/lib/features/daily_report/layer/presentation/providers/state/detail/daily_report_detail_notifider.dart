import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../domain/repositories/daily_report_repository.dart';
import '../../enum_daily_report.dart';
import 'daily_report_detail_state.dart';

class DailyReportDetailNotifier extends StateNotifier<DailyReportDetailState> {
  final DailyReportRepository dailyReportRepository;

  DailyReportDetailNotifier(
    this.dailyReportRepository,
  ) : super(const DailyReportDetailState.inital());

  bool get isFetching => state.state != EnumDailyReportDetail.loading;

  Future<void> fetchDetailReport({required String farmingCycleId, required Report report}) async {
    if (isFetching) {
      state = state.copyWith(
        report: const Report(),
        state: EnumDailyReportDetail.loading,
        message: 'Sedang Fetch Data',
      );
      final response = await dailyReportRepository.getDetailReport(farmingCycleId: farmingCycleId, date: report.date!);

      state = response.fold(
        (failure) => state.copyWith(
          state: EnumDailyReportDetail.error,
          message: failure.message,
        ),
        (data) {
          final reportData = data;

          return state.copyWith(
            report: reportData,
            state: EnumDailyReportDetail.loaded,
            isCanRevision: (report.status == EnumDailyReport.LATE || report.status == EnumDailyReport.FINISHED) && reportData.revisionStatus == null,
            isCanEdit: report.status! != EnumDailyReport.LATE && report.status! != EnumDailyReport.FINISHED && reportData.revisionStatus != 'REVISED',
            message: 'Berhasil Fetch Data',
          );
        },
      );
    } else {
      state = state.copyWith(
        state: EnumDailyReportDetail.error,
        message: 'Sedang Fetch Data',
      );
    }
  }

  void resetState() {
    state = const DailyReportDetailState.inital();
  }
}
