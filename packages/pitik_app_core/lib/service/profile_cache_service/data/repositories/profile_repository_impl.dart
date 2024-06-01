import 'package:pitik_app_core/pitik_app_core.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl(this.dataSource);

  final ProfileDataSource dataSource;

  @override
  Future<bool> deleteProfile() {
    return dataSource.deleteProfile();
  }

  @override
  Future<Either<AppException, User>> fetchProfile() {
    return dataSource.fetchProfile();
  }

  @override
  Future<bool> saveProfile({required User user}) {
    return dataSource.saveProfile(user: user);
  }

  @override
  Future<bool> hasProfile() {
    return dataSource.hasProfile();
  }
}
