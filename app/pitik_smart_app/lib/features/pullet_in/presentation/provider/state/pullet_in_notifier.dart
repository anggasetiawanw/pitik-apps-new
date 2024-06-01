import 'dart:io';

import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../domain/repositories/pullet_in_repository.dart';
import 'pullet_in_state.dart';

class PulletInNotifier extends StateNotifier<PulletInState> {
  final PulletInRepository repository;
  PulletInNotifier(this.repository) : super(const PulletInState.initial());

  Future<void> getRequestChickin({required String farmingCycleId}) async {
    state = state.copyWith(state: EnumPulletInState.loadingFetch);
    final result = await repository.getRequestChickin(farmingCycleId: farmingCycleId);
    result.fold(
      (failure) => state = state.copyWith(
        state: EnumPulletInState.error,
        message: failure.message,
      ),
      (data) => state = state.copyWith(
        state: EnumPulletInState.successFetch,
        isAlreadySubmit: data.hasFinishedDOCin != null && data.hasFinishedDOCin! ? true : false,
        requestChickin: data,
      ),
    );
  }

  Future<void> uploapSuratJalan({required File file}) async {
    state = state.copyWith(
      state: EnumPulletInState.loading,
    );
    final result = await repository.uploadMedia(file: file);
    result.fold(
      (failure) => state = state.copyWith(
        state: EnumPulletInState.error,
        message: failure.message,
      ),
      (data) => state = state.copyWith(
        state: EnumPulletInState.mfSuratUploaded,
        mediaListSurat: [
          ...state.mediaListSurat,
          data,
        ],
      ),
    );
  }

  Future<void> uploadForm({required File file}) async {
    state = state.copyWith(state: EnumPulletInState.loading);
    final result = await repository.uploadMedia(file: file);
    result.fold(
      (failure) => state = state.copyWith(
        state: EnumPulletInState.error,
        message: failure.message,
      ),
      (data) => state = state.copyWith(
        state: EnumPulletInState.mfFormUploaded,
        mediaForm: [...state.mediaForm, data],
      ),
    );
  }

  Future<void> uploadDocument({required File file}) async {
    state = state.copyWith(state: EnumPulletInState.loading);
    final result = await repository.uploadMedia(file: file);
    result.fold(
      (failure) => state = state.copyWith(
        state: EnumPulletInState.error,
        message: failure.message,
      ),
      (data) => state = state.copyWith(
        state: EnumPulletInState.mfDocumentUploaded,
        mediaDocument: [...state.mediaDocument, data],
      ),
    );
  }

  Future<void> addPulletIn({required RequestChickin requestChickin, required String farmingCycleId}) async {
    state = state.copyWith(state: EnumPulletInState.loading);
    final result = await repository.createRequestChickin(
      requestChickin: requestChickin,
      farmingCycleId: farmingCycleId,
    );
    result.fold(
      (failure) => state = state.copyWith(
        state: EnumPulletInState.error,
        message: failure.message,
      ),
      (data) => state = state.copyWith(
        state: EnumPulletInState.success,
        requestChickin: data,
      ),
    );
  }

  void resetState() {
    state = const PulletInState.initial();
  }
}
