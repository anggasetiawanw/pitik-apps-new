import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import 'app.dart';
import 'observers.dart';

FutureOr<void> main() async {
  await initPlatformState();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: PitikColors.primaryOrange,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(ProviderScope(
    observers: [
      Observers(),
    ],
    child: PitikSmartApp(),
  ));
}

Future<void> initPlatformState() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //     // options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseConfig.setupCrashlytics();
  // FirebaseConfig.setupRemoteConfig();

  // final String? token = await FirebaseConfig.setupCloudMessaging();
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.setString(TOKEN_STORAGE_KEY, token ?? '-');
}
