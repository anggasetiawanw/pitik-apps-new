import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../domain/repositories/login_repositories.dart';
import '../datasource/login_remote_datasource.dart';

class AuthenticationRepositoryImpl extends LoginRepository {
  final LoginUserDataSource dataSource;

  AuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, Auth>> loginUser({required User user}) {
    return dataSource.loginUser(user: user);
  }

  @override
  Future<Either<AppException, Response>> addDevice({required String token, required String type, required String os, required String model}) {
    return dataSource.addDevice(token: token, type: type, os: os, model: model);
  }

  @override
  Future<Either<AppException, User>> getProfile({required Auth auth}) {
    return dataSource.getProfile(auth: auth);
  }
}
