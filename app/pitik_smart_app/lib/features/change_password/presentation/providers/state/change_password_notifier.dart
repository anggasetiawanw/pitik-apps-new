import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../domain/repositories/change_password_repositories.dart';
import 'change_password_state.dart';

class ChangePasswordNotifier extends StateNotifier<ChangePasswordState> {
  final ChangePasswordRepository changePasswordNotifier;

  ChangePasswordNotifier({
    required this.changePasswordNotifier,
  }) : super(const ChangePasswordState.initial());

  Future<void> changePasswordUser({required String oldPassword, required String newPassword,required String confPassword}) async {
    state = const ChangePasswordState.loading();
    final response = await changePasswordNotifier.changePasswordUser(
      user: User(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmationPassword: confPassword,
      ),
    );

    state = await response.fold(
      (failure) => ChangePasswordState.failure(failure),
      (auth) async {
        return const ChangePasswordState.success();
      },
    );
  }
}
