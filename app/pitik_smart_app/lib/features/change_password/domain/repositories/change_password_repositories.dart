import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

abstract class ChangePasswordRepository {
  Future<Either<AppException, User>> changePasswordUser({required User user});
}
