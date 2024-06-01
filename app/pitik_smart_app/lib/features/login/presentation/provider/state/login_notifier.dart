import 'dart:io';

import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../../utils/utils.dart';
import '../../../domain/repositories/login_repositories.dart';
import 'login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginRepository loginRepository;
  final AuthRepository authRepository;
  final ProfileRepository profileRepository;

  LoginNotifier({
    required this.loginRepository,
    required this.authRepository,
    required this.profileRepository,
  }) : super(const LoginState.initial());

  Future<void> loginUser(String username, String password) async {
    state = const LoginState.loading();
    final response = await loginRepository.loginUser(
      user: User(username: username, password: password),
    );

    response.fold(
      (failure) => state = LoginState.failure(failure),
      (auth) async {
        final hasSavedUser = await authRepository.saveUser(auth: auth);
        if (hasSavedUser) {
          final responseProfile = await loginRepository.getProfile(auth: auth);
          responseProfile.fold(
            (failure) => state = LoginState.failure(failure),
            (user) async {
              final hasSavedProfile = await profileRepository.saveProfile(user: user);

              UtilsApp.setProfile(user);
              if (hasSavedProfile) {
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                final String token = prefs.getString(TOKEN_STORAGE_KEY) ?? '';
                final PackageInfo packageInfo = await PackageInfo.fromPlatform();
                final responseDevice = await loginRepository.addDevice(token: token, type: Platform.isAndroid ? 'android' : 'ios', os: packageInfo.version, model: '-');
                responseDevice.fold(
                  (failure) => state = LoginState.failure(failure),
                  (device) async {
                    await prefs.setString(ID_TOKEN_STORAGE_KEY, device.data['id']);
                    final bool isFirstLogin = prefs.getBool(APP_FIRST_LOGIN_STORAGE_KEY) ?? true;
                    if (isFirstLogin == true) {
                      state = const LoginState.isFirstLogin();
                    } else if (auth.action == DEFAULT_PASSWORD) {
                      state = const LoginState.isDefaultPassword();
                    } else {
                      state = const LoginState.success();
                    }
                  },
                );
              }
            },
          );
        } else {
          state = LoginState.failure(CacheFailureException());
        }
      },
    );
  }
}
