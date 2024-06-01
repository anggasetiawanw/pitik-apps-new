import 'package:pitik_app_core/pitik_app_core.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this.dataSource);

  final AuthDataSource dataSource;

  @override
  Future<bool> deleteUser() {
    return dataSource.deleteUser();
  }

  @override
  Future<Either<AppException, Auth>> fetchUser() {
    return dataSource.fetchUser();
  }

  @override
  Future<bool> saveUser({required Auth auth}) {
    return dataSource.saveUser(user: auth);
  }

  @override
  Future<bool> hasUser() {
    return dataSource.hasUser();
  }
}
