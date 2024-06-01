import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../data/datasource/pullet_in_datasource.dart';
import '../../data/repositories/pullet_in_repository_impl.dart';
import '../repositories/pullet_in_repository.dart';

final pulletInDatasourceProvider = Provider.family<PulletInDatasource, NetworkService>(
  (_, networkService) => PulletInRemoteDatasource(
    networkService: networkService,
  ),
);

final pulletInRepositoryProvider = Provider<PulletInRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(pulletInDatasourceProvider(networkService));
  return PulletInRepositoryImpl(datasource);
});
