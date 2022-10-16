import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  static final LocalNotificationsService _instance =
      LocalNotificationsService._internal();

  LocalNotificationsService._internal();
  static LocalNotificationsService get i => _instance;

  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  int id = 1;

  Future<void> initialize() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const iOSinitial = DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: iOSinitial,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  NotificationDetails getGroupNotifier() {
    InboxStyleInformation inboxStyleInformation = InboxStyleInformation([],
        contentTitle: '$id mensajes', summaryText: 'Admin meli');

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'admin-meli-2022',
      'admin-meli',
      channelDescription: 'Admin meli',
      styleInformation: inboxStyleInformation,
      importance: Importance.max,
      playSound: true,
      groupKey: 'co.malusoft.admin_meli_app',
      setAsGroupSummary: true,
    );

    return NotificationDetails(android: androidNotificationDetails);
  }

  Future<void> showNotification({
    int id = 0,
    String title = '',
    String body = '',
    String? payload,
  }) async {
    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'admin-meli-2022',
        'admin-meli',
        channelDescription: 'Admin meli',
        importance: Importance.max,
        playSound: true,
        groupKey: 'co.malusoft.admin_meli_app',
      ),
    );
    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );

    id = id + 1;

    NotificationDetails groupNotification = getGroupNotifier();
    await _flutterLocalNotificationsPlugin.show(
      0,
      'Admin meli',
      '$id mensajes',
      groupNotification,
    );
  }
}
