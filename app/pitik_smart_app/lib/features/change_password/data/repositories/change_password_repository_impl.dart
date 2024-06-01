import 'package:pitik_app_core/domain/models/either.dart';
import 'package:pitik_app_core/domain/models/user/user_model.dart';
import 'package:pitik_app_core/exceptions/http_exception.dart';

import '../../domain/repositories/change_password_repositories.dart';
import '../datasource/change_password_remote_dto.dart';

class ChangePasswordRepositoryImpl extends ChangePasswordRepository {
  final ChangePasswordDataSource dataSource;

  ChangePasswordRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, User>> changePasswordUser({required User user}) {
    return dataSource.changePassword(user: user);
  }
}
