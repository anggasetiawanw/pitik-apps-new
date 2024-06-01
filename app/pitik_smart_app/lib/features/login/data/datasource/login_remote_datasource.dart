import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

abstract class LoginUserDataSource {
  Future<Either<AppException, Auth>> loginUser({required User user});
  Future<Either<AppException, User>> getProfile({required Auth auth});
  Future<Either<AppException, Response>> addDevice({
    required String token,
    required String type,
    required String os,
    required String model,
  });
}

class LoginUserRemoteDataSource implements LoginUserDataSource {
  final NetworkService networkService;

  LoginUserRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, Auth>> loginUser({required User user}) async {
    try {
      final eitherType = await networkService.post(
        'v2/auth',
        data: user.toJson(),
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          final auth = Auth.fromJson(response.data);
          networkService.updateHeader(
            {
              'Authorization': auth.token,
              'X-ID': auth.id,
            },
          );

          return Right(auth);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, User>> getProfile({required Auth auth}) async {
    try {
      final eitherType = await networkService.get(
        'v2/fms-users/me',
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          final user = User.fromJson(response.data);
          // update the token for requests
          return Right(user);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> addDevice({required String token, required String type, required String os, required String model}) async {
    try {
      final eitherType = await networkService.post(
        'v2/devices',
        data: {
          'token': token,
          'type': type,
          'os': os,
          'model': model,
        },
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }
}
