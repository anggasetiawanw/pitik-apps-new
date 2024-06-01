// ignore_for_file: prefer_final_locals

import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../domain/repositories/daily_report_repository.dart';
import 'daily_report_revision_state.dart';

class DailyReportRevisionNotifier extends StateNotifier<DailyReportRevisionState> {
  final DailyReportRepository repository;
  DailyReportRevisionNotifier(this.repository) : super(const DailyReportRevisionState.initial());

  void updateRevisionReasonList({required String reason, required bool isAdd}) {
    if (state.revisionReasonList.contains(reason)) {
      List<String> newList = List.from(state.revisionReasonList);
      if (isAdd) {
        newList.add(reason);
        state = state.copyWith(revisionReasonList: newList);
      } else {
        newList.remove(reason);
        state = state.copyWith(revisionReasonList: newList);
      }
    } else {
      if (isAdd) {
        List<String> newList = List.from(state.revisionReasonList);
        newList.add(reason);
        state = state.copyWith(revisionReasonList: newList);
      }
    }
  }

  Future<void> requestDailyReportRevision({required String farmingCycleId, required String date, required String reason}) async {
    state = state.copyWith(state: EnumDailyReportRevisionState.loading);
    final response = await repository.requestDailyReportRevision(farmingCycleId: farmingCycleId, date: date, payload: DailyReportRevision(reason: reason, changes: state.revisionReasonList));
    state = response.fold(
      (failure) => state.copyWith(
        state: EnumDailyReportRevisionState.error,
        message: failure.message,
      ),
      (data) {
        return state.copyWith(
          state: EnumDailyReportRevisionState.success,
          message: 'Berhasil Request Revisi',
        );
      },
    );
  }

  void changeStateRevision(int index) {
    state = state.copyWith(stateReasonRevision: index);
  }

  void resetState() {
    state = const DailyReportRevisionState.initial();
  }
}
