import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../domain/provider/layer_providers.dart';
import 'state_layer_home/layer_home_notifier.dart';
import 'state_layer_home/layer_home_state.dart';

final layerHomeProvider = StateNotifierProvider<LayerHomeNotifier, LayerHomeState>((ref) {
  final repository = ref.watch(layerRepositoryProvider);
  return LayerHomeNotifier(repository);
});
