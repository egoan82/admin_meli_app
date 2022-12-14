// ignore_for_file: unused_import

import 'dart:async';
import 'dart:math';
import 'dart:io' show Platform;

import 'package:admin_meli_app/app/data/firebase/cloud_firestore.dart';
import 'package:admin_meli_app/app/data/local/local_notifications_service.dart';
import 'package:admin_meli_app/app/domain/models/session.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';

import '../local/authentication_client.dart';

class PushNotificationService {
  static AuthenticationClient autenticationClient =
      GetIt.I.get<AuthenticationClient>();
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

    saveToken();

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    // print("ID DEVICE $idDevice");

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

  static saveToken() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    final getInfoDevice = await autenticationClient.getInfoDevice;

    String idDevice = '';

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      idDevice = androidInfo.id;
      // if (!androidInfo.isPhysicalDevice) return;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      idDevice = iosInfo.identifierForVendor ?? '';
      // if (!iosInfo.isPhysicalDevice) return;
    }

    token = await FirebaseMessaging.instance.getToken();

    if (token == null) return;

    if (getInfoDevice.isEmpty) {
      CloudFirestore.i.saveTokenPhone(token!, idDevice);
      return;
    }

    if (token != "getInfoDevice['tokenDevice']") {
      CloudFirestore.i.updateTokenPhone(
        token!,
        idDevice,
        getInfoDevice['idFireBase'],
      );
    }
  }

  static closeStreams() {
    _messageStream.close();
  }
}
