import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:thereds_flutter_loyalty/app/data/Constants.dart';
import '../../firebase_options.dart';
import 'shared_prefs.dart';

GetIt locator = GetIt.instance;
PreferencesUtil util = PreferencesUtil();
FirebaseMessaging? messaging;

Future baseDio() async {
  final options = BaseOptions(
    connectTimeout: const Duration(seconds: 300000),
    receiveTimeout: const Duration(seconds: 300000),
  );

  var dio = Dio(options);

  dio..interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseHeader: true,
    responseBody: true,
    error: true,
  ));

  locator.registerSingleton<Dio>(dio);
}

Future setupLocator() async {
  PreferencesUtil? util = await PreferencesUtil.getInstance();
  locator.registerSingleton<PreferencesUtil>(util!);
}

Future<bool?> isInternetAvailable() async {
  bool? hasInet;
  int timeout = 5;
  try {
    http.Response response = await http
        .get(Uri.parse('https://google.com'))
        .timeout(Duration(seconds: timeout));
    if (response.statusCode == 200) {
      hasInet = true;
    } else {
      // handle it
    }
  } on TimeoutException {
    hasInet = false;
  } on SocketException {
    hasInet = false;
  } on Error {
    hasInet = false;
  }
  return hasInet;
}

@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage msg) async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  FlutterLocalNotificationsPlugin flutterLocalNotif =
      FlutterLocalNotificationsPlugin();

  String title = msg.data['title'] ?? "KISS Mobile";
  String deskripsi = msg.data['body'] ?? "";

  if(msg.data.length>0){
    flutterLocalNotif.show(
      msg.hashCode,
      title,
      deskripsi,
      payload: msg.data['title'],
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "KISS",
          "KISS Mobile",
          channelDescription: "KISS Notification Channel",
          icon: '@mipmap/ic_launcher',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

}

class notifUtils {
  static BuildContext? bContext;

  void init(BuildContext context) {
    bContext = context;

    print("init context");
  }

  Future initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    messaging = FirebaseMessaging.instance;
    FlutterLocalNotificationsPlugin flutterLocalNotif =
        FlutterLocalNotificationsPlugin();

    debugPrint("FirebaseMsg initialized!!!");

    subscribeToNotificationTopic();

    FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
      //
      // print('Notif title: ${msg.data['title']}');
      // debugPrint("notif body: ${msg.data["body"]}");

      String title = msg.data['title'] ?? "The Reds";
      String deskripsi = msg.data['body'] ?? "";

      flutterLocalNotif.show(
        msg.hashCode,
        title,
        deskripsi,
        payload: msg.data['title'],
        const NotificationDetails(
          android: AndroidNotificationDetails(
            "The Reds",
            "The Reds",
            channelDescription: "The Reds Notification Channel",
            icon: '@mipmap/ic_launcher',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
      );
    });

    FirebaseMessaging.onBackgroundMessage(backgroundHandler);

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        // App was opened from a terminated state by tapping a notification
        print('App opened from terminated state with message: $message');
      }
    });

    if (Constants.dbTestingName == "") {
      messaging!.subscribeToTopic("TheReds_Public_Notification_Feed");
      debugPrint(
          "subscribe to channel [TheReds_Public_Notification_Feed]");
    } else {
      messaging!.subscribeToTopic("TheReds_Public_Notification_Feed_Test");
      debugPrint(
          "subscribe to channel [TheReds_Public_Notification_Feed_Test]");
    }

    messaging!.getToken().then((token) {
      debugPrint("token messaging : $token");
    });

    messaging!.onTokenRefresh.listen(tokenRefresh, onError: tokenRefreshFail);
  }

  void tokenRefresh(String newToken) async {
    debugPrint("new Token: $newToken");
  }

  void tokenRefreshFail(error) {
    debugPrint("FCM token refresh fail with error $error");
  }

  void subscribeToPersonalTopic(String kode) {
    if (Constants.dbTestingName == "") {
      messaging!.subscribeToTopic(
          "TheReds_${kode.replaceAll("/", "")}_Notification_Feed");
      debugPrint(
          "subscribe to channel [TheReds_${kode.replaceAll("/", "")}_Notification_Feed]");
    }

    else {
      messaging!.subscribeToTopic(
          "TheReds_${kode.replaceAll("/", "")}_Notification_Feed_Test");
      debugPrint(
          "subscribe to channel [TheReds_${kode.replaceAll("/", "")}_Notification_Feed_Test]");
    }
  }

  void subscribeToNotificationTopic(){
    if (Constants.dbTestingName == "") {
      messaging!.subscribeToTopic(
          "TheReds_${Constants.cabang}_Notification_Feed");
      debugPrint(
          "subscribe to channel [TheReds_${Constants.cabang}_Notification_Feed]");
    }

    else {
      messaging!.subscribeToTopic(
          "TheReds_${Constants.cabang}_Notification_Feed_Test");
      debugPrint(
          "subscribe to channel [TheReds_${Constants.cabang}_Notification_Feed_Test]");
    }
  }

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      Map<String, dynamic>? notifMsg) async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notification) async {
      debugPrint('notification: ${notification.id}');

      var payload = notification.payload!;
      String totalSaldoUser="0";
      if (payload != "") {
        debugPrint('notification payload: ' + notification.payload!);
        if (payload.toLowerCase().contains("rekapitulasi")) {
          print("Tapped Notif");
        } else if (payload.toLowerCase().contains("bukan")) {
          print("bukan anggota");
        } else if (payload.toLowerCase().contains("rat")) {
        } else if (payload.toLowerCase().contains("reminder")) {
        }
      }
    },
        //onDidReceiveBackgroundNotificationResponse: backNotifHandler
    );
  }

  // static backNotifHandler(NotificationResponse notification) async {
  //   debugPrint('notification: ${notification.id}');
  //
  //   var payload = notification.payload!;
  //   if (payload != "") {
  //     debugPrint('notification payload: ' + notification.payload!);
  //     if (payload.toLowerCase().contains("rekapitulasi")) {
  //       print("Tapped Notif");
  //       util.putBool(PreferencesUtil.toPengunduran, true);
  //     } else if (payload.toLowerCase().contains("bukan")) {
  //       print("bukan anggota");
  //     } else if (payload.toLowerCase().contains("rat")) {
  //       print("rat");
  //     } else if (payload.toLowerCase().contains("reminder")) {
  //       if (payload.toLowerCase().contains("mendekati")) {
  //         print("mendekatijatuhtempo");
  //       } else if (payload.toLowerCase().contains("jatuhtempo")) {
  //         print("jatuhtempo");
  //       }
  //     }
  //   }
  // }
}
