import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

abstract class LoginRepository {
  Future<Either<AppException, Auth>> loginUser({required User user});
  Future<Either<AppException, User>> getProfile({required Auth auth});
  Future<Either<AppException, Response>> addDevice({
    required String token,
    required String type,
    required String os,
    required String model,
  });
}
