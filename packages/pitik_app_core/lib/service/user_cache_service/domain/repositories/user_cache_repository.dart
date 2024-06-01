import 'package:pitik_app_core/pitik_app_core.dart';

abstract class AuthRepository {
  Future<Either<AppException, Auth>> fetchUser();
  Future<bool> saveUser({required Auth auth});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}
