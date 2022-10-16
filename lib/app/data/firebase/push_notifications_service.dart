import 'dart:async';
import 'dart:math';

import 'package:admin_meli_app/app/data/firebase/cloud_firestore.dart';
import 'package:admin_meli_app/app/data/local/local_notifications_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static String? token;
  static final StreamController<String> _messageStream =
      StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    // print('onBackground Handler ${message.messageId}');
    // print(message.data);
    _messageStream.add('onBackground Handler ${message.messageId}');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // print('onMessage Handler ${message.messageId}');
    // print(message.data);
    _messageStream.add('onMessage Handler ${message.messageId}');
    if (message.notification != null) {
      LocalNotificationsService.i.showNotification(
        id: Random().nextInt(100),
        title: "${message.notification!.title}",
        body: message.notification!.body ?? 'sin mensaje',
      );
    }
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    // print('onMessageOpenApp Handler ${message.messageId}');
    // print(message.data);
    _messageStream.add('onMessageOpenApp Handler ${message.messageId}');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    await requestPermission();

    token = await FirebaseMessaging.instance.getToken();

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    // CloudFirestore.i.saveTokenPhone(token!);

    FirebaseMessaging.instance.onTokenRefresh.listen(
      (token) {
        // CloudFirestore.i.updateTokenPhone(token);
      },
      onDone: () {},
      onError: (e) {},
    );

    // Local Notifications
  }

  // Apple / Web
  static requestPermission() async {
    // ignore: unused_local_variable
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static closeStreams() {
    _messageStream.close();
  }
}
