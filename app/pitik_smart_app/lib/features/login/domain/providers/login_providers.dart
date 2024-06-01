import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../data/datasource/login_remote_datasource.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../repositories/login_repositories.dart';

final loginDataSourceProvider = Provider.family<LoginUserDataSource, NetworkService>(
  (_, networkService) => LoginUserRemoteDataSource(networkService),
);

final loginRepositoryProvider = Provider<LoginRepository>(
  (ref) {
    final NetworkService networkService = ref.watch(networkServiceProvider);
    final LoginUserDataSource dataSource = ref.watch(loginDataSourceProvider(networkService));
    return AuthenticationRepositoryImpl(dataSource);
  },
);
