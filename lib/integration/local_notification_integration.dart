import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationIntegration {
  Future<void> initialiseLocalNotification() async {
    InitializationSettings initializationSettings = InitializationSettings(
        android: _androidInitializationSettings,
        iOS: initializationSettingsDarwin);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      const AndroidInitializationSettings("@mipmap/ic_launcher");

  final DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
    onDidReceiveLocalNotification:
        (int id, String? title, String? body, String? payload) async {
      // didReceiveLocalNotificationStream.add(
      //   ReceivedNotification(
      //     id: id,
      //     title: title,
      //     body: body,
      //     payload: payload,
      //   ),
      // );
    },
    // notificationCategories: darwinNotificationCategories,
  );

  void sendNotification(String title, body) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("channelId", "channelName",
            importance: Importance.max, priority: Priority.high);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }
}
