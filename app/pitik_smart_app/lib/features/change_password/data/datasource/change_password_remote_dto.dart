import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

abstract class ChangePasswordDataSource {
  Future<Either<AppException, User>> changePassword({required User user});
}

class ChangePasswordRemoteDataSource implements ChangePasswordDataSource {
  final NetworkService networkService;

  ChangePasswordRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, User>> changePassword({required User user}) async {
    try {
      final eitherType = await networkService.post(
        'v2/auth/reset-password',
        data: user.toJson(),
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          final user = User.fromJson(response.data);

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
}
