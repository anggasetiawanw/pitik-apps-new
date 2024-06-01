import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../domain/providers/change_password_providers.dart';
import '../../domain/repositories/change_password_repositories.dart';
import 'state/change_password_notifier.dart';
import 'state/change_password_state.dart';

final changePasswordStateNotifierProvider = StateNotifierProvider<ChangePasswordNotifier, ChangePasswordState>(
  (ref) {
    final ChangePasswordRepository changePasswordNotifier = ref.watch(changePasswordRepositoryProvider);
    return ChangePasswordNotifier(changePasswordNotifier: changePasswordNotifier);
  },
);
