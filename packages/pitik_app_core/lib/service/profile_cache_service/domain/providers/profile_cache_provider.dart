import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_core/pitik_app_core.dart';

final profileDatasourceProvider = Provider.family<ProfileDataSource, StorageService>(
  (_, networkService) => ProfileLocalDatasource(networkService),
);

final profileLocalRepositoryProvider = Provider<ProfileRepository>((ref) {
  final storageService = ref.watch(storageServiceProvider);

  final datasource = ref.watch(profileDatasourceProvider(storageService));

  final repository = ProfileRepositoryImpl(datasource);

  return repository;
});
