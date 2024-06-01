import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../domain/providers/login_providers.dart';
import '../../domain/repositories/login_repositories.dart';
import 'state/login_notifier.dart';
import 'state/login_state.dart';

final loginStateNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) {
    final LoginRepository loginRepository = ref.watch(loginRepositoryProvider);
    final AuthRepository authRepository = ref.watch(userLocalRepositoryProvider);
    final ProfileRepository profileRepository = ref.watch(profileLocalRepositoryProvider);
    return LoginNotifier(
      loginRepository: loginRepository,
      authRepository: authRepository,
      profileRepository: profileRepository,
    );
  },
);
