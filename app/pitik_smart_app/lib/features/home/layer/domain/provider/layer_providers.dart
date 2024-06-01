import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../data/datasource/layer_remote_datasource.dart';
import '../../data/repositories/layer_repositories_impl.dart';
import '../repositories/layer_repositories.dart';

final layerDataSourceProvider = Provider.family<LayerDatasource, NetworkService>(
  (_, networkService) => LayerRemoteDatasource(networkService),
);

final layerRepositoryProvider = Provider<LayerRepository>(
  (ref) {
    final NetworkService networkService = ref.watch(networkServiceProvider);
    final LayerDatasource datasource = ref.watch(layerDataSourceProvider(networkService));
    return LayerRepositoryImpl(datasource);
  },
);
