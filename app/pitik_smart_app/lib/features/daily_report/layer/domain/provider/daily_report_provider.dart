import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../data/datasource/daily_report_datasource.dart';
import '../../data/repositories/daily_report_repository_impl.dart';
import '../repositories/daily_report_repository.dart';

final dailyReportDatasourceProvider = Provider.family<DailyReportDataSource, NetworkService>((ref, networkService) {
  return DailyReportRemoteDatasource(networkService);
});

final dailyReportRepositoryProvider = Provider<DailyReportRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(dailyReportDatasourceProvider(networkService));
  final repository = DailyReportRepositoryImpl(datasource);
  return repository;
});
