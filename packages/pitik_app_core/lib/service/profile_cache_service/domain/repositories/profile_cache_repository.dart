import 'package:pitik_app_core/pitik_app_core.dart';

abstract class ProfileRepository {
  Future<Either<AppException, User>> fetchProfile();
  Future<bool> saveProfile({required User user});
  Future<bool> deleteProfile();
  Future<bool> hasProfile();
}
