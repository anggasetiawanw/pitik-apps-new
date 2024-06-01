import 'dart:convert';

import 'package:pitik_app_core/pitik_app_core.dart';

abstract class AuthDataSource {
  String get storageKey;

  Future<Either<AppException, Auth>> fetchUser();
  Future<bool> saveUser({required Auth user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}

class AuthLocalDatasource extends AuthDataSource {
  AuthLocalDatasource(this.storageService);

  final StorageService storageService;

  @override
  String get storageKey => USER_LOCAL_STORAGE_KEY;

  @override
  Future<Either<AppException, Auth>> fetchUser() async {
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

    return Right(Auth.fromJson(userJson));
  }

  @override
  Future<bool> saveUser({required Auth user}) async {
    return await storageService.set(storageKey, jsonEncode(user.toJson()));
  }

  @override
  Future<bool> deleteUser() async {
    return await storageService.remove(storageKey);
  }

  @override
  Future<bool> hasUser() async {
    return await storageService.has(storageKey);
  }
}
