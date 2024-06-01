import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_core/data/local/storage_service.dart';
import 'package:pitik_app_core/domain/providers/shared_preferences_storage_service_provider.dart';
import 'package:pitik_app_core/service/user_cache_service/data/datasource/user_local_datasource.dart';
import 'package:pitik_app_core/service/user_cache_service/data/repositories/user_repository_impl.dart';
import 'package:pitik_app_core/service/user_cache_service/domain/repositories/user_cache_repository.dart';

final userDatasourceProvider = Provider.family<AuthDataSource, StorageService>(
  (_, networkService) => AuthLocalDatasource(networkService),
);

final userLocalRepositoryProvider = Provider<AuthRepository>((ref) {
  final storageService = ref.watch(storageServiceProvider);

  final datasource = ref.watch(userDatasourceProvider(storageService));

  final repository = AuthRepositoryImpl(datasource);

  return repository;
});
