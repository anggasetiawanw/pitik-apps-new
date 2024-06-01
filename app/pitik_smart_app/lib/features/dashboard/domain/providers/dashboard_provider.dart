import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../data/datasource/dashboard_remote_datasource.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../repositories/dashboard_repositories.dart';

final dashboardDatasourceProvider = Provider.family<DashboardDatassource, NetworkService>(
  (_, networkService) => DashboardRemoteDatasource(networkService),
);
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(dashboardDatasourceProvider(networkService));
  final repository = DashboardRepositoryImpl(datasource);

  return repository;
});
