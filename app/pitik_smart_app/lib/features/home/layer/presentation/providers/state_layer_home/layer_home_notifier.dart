import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../domain/repositories/layer_repositories.dart';
import 'layer_home_state.dart';

class LayerHomeNotifier extends StateNotifier<LayerHomeState> {
  final LayerRepository _layerRepository;

  LayerHomeNotifier(this._layerRepository) : super(const LayerHomeState.initial());

  bool get isFecthing => state.state != EnumLayerHomeState.loading;

  Future<void> fetchPerformance({required String farmingCycleId}) async {
    if (isFecthing) {
      state = state.copyWith(
        state: EnumLayerHomeState.loading,
        isLoading: true,
      );
      final response = await _layerRepository.getLayerMonitoringData(farmingCycleId: farmingCycleId);
      state = response.fold(
        (failure) => state = state.copyWith(
          state: EnumLayerHomeState.failure,
          message: failure.message,
          isLoading: false,
        ),
        (data) => state = state.copyWith(
          state: EnumLayerHomeState.loaded,
          monitoring: data,
          isLoading: false,
        ),
      );
    } else {
      state = state.copyWith(
        state: EnumLayerHomeState.loaded,
        message: 'Sedang Fetch Data',
        isLoading: false,
      );
    }
  }
}
