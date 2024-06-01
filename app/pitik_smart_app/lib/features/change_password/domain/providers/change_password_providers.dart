import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../data/datasource/change_password_remote_dto.dart';
import '../../data/repositories/change_password_repository_impl.dart';
import '../repositories/change_password_repositories.dart';

final changePasswordDatasourceProvider = Provider.family<ChangePasswordDataSource, NetworkService>(
  (_, networkService) => ChangePasswordRemoteDataSource(networkService),
);

final changePasswordRepositoryProvider = Provider<ChangePasswordRepository>(
  (ref) {
    final NetworkService networkService = ref.watch(networkServiceProvider);
    final ChangePasswordDataSource dataSource = ref.watch(changePasswordDatasourceProvider(networkService));
    return ChangePasswordRepositoryImpl(dataSource);
  },
);
