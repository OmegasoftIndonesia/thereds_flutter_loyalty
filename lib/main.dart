import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/util/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await baseDio();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  await notifUtils().initFirebase();
  await notifUtils().initNotifications(flutterLocalNotificationsPlugin, null);
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  final settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  debugPrint('Notification permission: ${settings.authorizationStatus}');
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    GetMaterialApp(
      title: "The Reds",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
