import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../domain/repositories/daily_report_repository.dart';
import 'daily_report_home_state.dart';

class DailyReportHomeNotifier extends StateNotifier<DailyReportHomeState> {
  final DailyReportRepository dailyReportRepository;

  DailyReportHomeNotifier(
    this.dailyReportRepository,
  ) : super(const DailyReportHomeState.initial());

  bool get isFetching => state.state != EnumDailyReportHomeState.loading;

  Future<void> fetchListReport({required String farmingCycleId}) async {
    if (isFetching) {
      state = state.copyWith(
        listReport: [],
        state: EnumDailyReportHomeState.loading,
        message: 'Sedang Fetch Data',
      );
      final response = await dailyReportRepository.getListDailyReport(farmingCycleId: farmingCycleId);

      state = response.fold(
          (failure) => state.copyWith(
                state: EnumDailyReportHomeState.error,
                message: failure.message,
              ), (data) {
        final listReport = data.data;
        return state.copyWith(
          listReport: listReport,
          state: EnumDailyReportHomeState.loaded,
          message: 'Berhasil Fetch Data',
        );
      });
    } else {
      state = state.copyWith(
        state: EnumDailyReportHomeState.loaded,
        message: 'Sedang Fetch Data',
      );
    }
  }
}
