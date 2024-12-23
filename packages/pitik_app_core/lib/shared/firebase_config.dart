// ignore_for_file: slash_for_doc_comments, depend_on_referenced_packages

import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// @author DICKY
/// @email <dicky.maulana@pitik.id>
/// @create date 14/09/2023

class FirebaseConfig {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// > Initialize Crashlytics and set it up to catch all errors and exceptions
  ///
  /// Returns:
  ///   A Future<void>
  static void setupCrashlytics() async {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }

  /// `setupRemoteConfig()` sets the fetch timeout to 5 seconds and the minimum
  /// fetch interval to 10 seconds
  static void setupRemoteConfig() async {
    await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(seconds: 20),
    ));

    await FirebaseRemoteConfig.instance.fetchAndActivate();
  }

  /// It sets up the Firebase Cloud Messaging service.
  ///
  /// Returns:
  ///   The token is being returned.
  static Future<String?> setupCloudMessaging() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (payload) async {});

    String? token = await FirebaseMessaging.instance.getToken(
        //   vapidKey: webCertificate,
        );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        _showNotification(flutterLocalNotificationsPlugin, message);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {});

    return token;
  }

  /// _showNotification() is a function that takes in a
  /// FlutterLocalNotificationsPlugin object and a RemoteMessage object as
  /// parameters and returns a Future<void> object
  ///
  /// Args:
  ///   flutterLocalNotificationsPlugin (FlutterLocalNotificationsPlugin): The
  /// instance of the plugin that you created in the main.dart file.
  ///   remoteMessage (RemoteMessage): The message received from Firebase.
  static Future<void> _showNotification(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin, RemoteMessage remoteMessage) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(remoteMessage.messageId!, remoteMessage.notification!.title!, channelDescription: remoteMessage.notification!.body!, playSound: true, importance: Importance.max, priority: Priority.high);

    await flutterLocalNotificationsPlugin.show(Random().nextInt(1000000), remoteMessage.notification!.title, remoteMessage.notification!.body, NotificationDetails(android: androidNotificationDetails, iOS: const DarwinNotificationDetails()),
        payload: jsonEncode(remoteMessage.data));
  }

  /// _firebaseMessagingBackgroundHandler is a function that is called when a
  /// notification is received while the app is in the background
  ///
  /// Args:
  ///   message (RemoteMessage): The message that was received.
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async => await Firebase.initializeApp();
}
