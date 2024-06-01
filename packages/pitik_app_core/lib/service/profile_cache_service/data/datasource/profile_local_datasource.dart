import 'dart:convert';

import 'package:pitik_app_core/pitik_app_core.dart';

abstract class ProfileDataSource {
  String get storageKey;

  Future<Either<AppException, User>> fetchProfile();
  Future<bool> saveProfile({required User user});
  Future<bool> deleteProfile();
  Future<bool> hasProfile();
}

class ProfileLocalDatasource extends ProfileDataSource {
  ProfileLocalDatasource(this.storageService);

  final StorageService storageService;

  @override
  String get storageKey => PROFILE_LOCAL_STORAGE_KEY;

  @override
  Future<Either<AppException, User>> fetchProfile() async {
    final data = await storageService.get(storageKey);
    if (data == null) {
      return Left(
        AppException(
          identifier: 'UserLocalDatasource',
          statusCode: 404,
          message: 'User not found',
        ),
      );
    }
    final userJson = jsonDecode(data.toString());

    return Right(User.fromJson(userJson));
  }

  @override
  Future<bool> saveProfile({required User user}) async {
    return await storageService.set(storageKey, jsonEncode(user.toJson()));
  }

  @override
  Future<bool> deleteProfile() async {
    return await storageService.remove(storageKey);
  }

  @override
  Future<bool> hasProfile() async {
    return await storageService.has(storageKey);
  }
}
