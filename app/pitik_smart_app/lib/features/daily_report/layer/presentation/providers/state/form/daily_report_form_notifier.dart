import 'dart:io';

import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../domain/repositories/daily_report_repository.dart';
import 'daily_report_form_state.dart';

class DailyReportFormNotifier extends StateNotifier<DailyReportFormState> {
  final DailyReportRepository repository;
  DailyReportFormNotifier(this.repository) : super(const DailyReportFormState.initial());

  bool get isFetching => state.state != EnumDailyReportFormState.loadingFetch;
  Future<void> fetchDetailReport({required String farmingCycleId, required Report report}) async {
    if (isFetching) {
      state = state.copyWith(
        report: const Report(),
        state: EnumDailyReportFormState.loadingFetch,
        message: 'Sedang Fetch Data',
      );
      final response = await repository.getDetailReport(farmingCycleId: farmingCycleId, date: report.date!);

      state = response.fold(
        (failure) => state.copyWith(
          state: EnumDailyReportFormState.error,
          message: failure.message,
        ),
        (data) {
          return state.copyWith(
            report: data,
            state: EnumDailyReportFormState.successFetch,
            message: 'Berhasil Fetch Data',
          );
        },
      );
    } else {
      state = state.copyWith(
        state: EnumDailyReportFormState.error,
        message: 'Sedang Fetch Data',
      );
    }
  }

  Future<void> uploadChickDead({required File file}) async {
    state = state.copyWith(state: EnumDailyReportFormState.loading);
    final result = await repository.uploadMedia(file: file);
    result.fold(
      (failure) => state = state.copyWith(
        state: EnumDailyReportFormState.error,
        message: failure.message,
      ),
      (data) => state = state.copyWith(
        state: EnumDailyReportFormState.mfChickDeadUploaded,
        mediaChickDead: [...state.mediaChickDead, data],
      ),
    );
  }

  Future<void> uploadChickRecord({required File file}) async {
    state = state.copyWith(state: EnumDailyReportFormState.loading);
    final result = await repository.uploadMedia(file: file);
    result.fold(
      (failure) => state = state.copyWith(
        state: EnumDailyReportFormState.error,
        message: failure.message,
      ),
      (data) => state = state.copyWith(
        state: EnumDailyReportFormState.mfChickRecordUploaded,
        mediaChickRecord: [...state.mediaChickRecord, data],
      ),
    );
  }

  Future<void> searchFeedBrand({required String keyword}) async {
    final result = await repository.getFeedBrand(keyword: keyword);
    result.fold(
      (failure) => state = state.copyWith(
        state: EnumDailyReportFormState.error,
        message: failure.message,
      ),
      (data) => state = state.copyWith(
        state: EnumDailyReportFormState.searchFeedDone,
        feedBrand: data.data,
      ),
    );
  }

  Future<void> searchOVK({required String keyword}) async {
    final result = await repository.getOvk(keyword: keyword);
    result.fold(
      (failure) => state = state.copyWith(
        state: EnumDailyReportFormState.error,
        message: failure.message,
      ),
      (data) => state = state.copyWith(
        state: EnumDailyReportFormState.searchOVKDone,
        ovk: data.data,
      ),
    );
  }

  Future<void> addReport({required String farmingCycleId, required Report payload, required String date}) async {
    state = state.copyWith(state: EnumDailyReportFormState.loading);
    final result = await repository.addReport(farmingCycleId: farmingCycleId, date: date, payload: payload);
    result.fold(
      (failure) => state = state.copyWith(
        state: EnumDailyReportFormState.error,
        message: failure.message,
      ),
      (data) => state = state.copyWith(
        state: EnumDailyReportFormState.success,
        report: data,
      ),
    );
  }

  Future<void> laodData() async {
    state = state.copyWith(state: EnumDailyReportFormState.loadingFetch);
    await Future.delayed(const Duration(milliseconds: 500));
    state = state.copyWith(
      state: EnumDailyReportFormState.successFetch,
    );
  }

  void setMediaChicKead({required MediaUploadModel media}) {
    state = state.copyWith(mediaChickDead: [...state.mediaChickDead, media]);
  }

  void setMediaChickRecord({required MediaUploadModel media}) {
    state = state.copyWith(mediaChickRecord: [...state.mediaChickRecord, media]);
  }

  void doneLoad() {
    state = state.copyWith(state: EnumDailyReportFormState.idle);
  }

  void totalCount({required double totalCount}) {
    state = state.copyWith(totalCount: totalCount);
  }

  void totalWeight({required double totalWeight}) {
    state = state.copyWith(totalWeight: totalWeight);
  }

  void changeStatePage({required int index}) {
    state = state.copyWith(statePage: index);
  }

  void resetState() {
    state = const DailyReportFormState.initial();
  }
}
