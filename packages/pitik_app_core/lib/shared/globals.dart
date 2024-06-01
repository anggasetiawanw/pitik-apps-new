import 'dart:io';

import 'package:pitik_app_core/log/log.dart';

final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');
const int PRODUCTS_PER_PAGE = 20;
const String USER_LOCAL_STORAGE_KEY = 'user';
const String PROFILE_LOCAL_STORAGE_KEY = 'profiles';
const String TOKEN_STORAGE_KEY = 'firebasetoken';
const String ID_TOKEN_STORAGE_KEY = 'id_firebasetoken';
const String APP_THEME_STORAGE_KEY = 'AppTheme';
const String DEFAULT_PASSWORD = 'DEFAULT_PASSWORD';
const String APP_FIRST_LOGIN_STORAGE_KEY = 'isFirstLoginv2';
const String APP_FIRST_LAUNCH_APP_KEY = 'isFirstLaunchAppv2';

void logDebug(String message) {
  Log().console("Tap : $message", type: LogType.debug);
}
