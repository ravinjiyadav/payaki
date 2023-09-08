import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:payaki/firebase_options.dart';
import 'package:payaki/integration/local_notification_integration.dart';
import 'package:payaki/logger/app_logger.dart';

class FirebaseIntegration {
  late final FirebaseMessaging _messaging;

  Future<void> setFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      logD('User granted permission');

      // For handling the received notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // Parse the message received
        logD(
            "Notification get\n${message.notification?.title}\n${message.notification?.body}");

        LocalNotificationIntegration().sendNotification(
            "${message.notification?.title}", "${message.notification?.body}");
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        logD("onMessageOpenedApp: $message");
      });
    } else {
      logD('User declined or has not accepted permission');
    }

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<String> getFirebaseToken() async {
    String token = "";
    _messaging = FirebaseMessaging.instance;
    await _messaging.getToken().then((value) {
      if (value != null) {
        token = value!;
        logD(token);
      }
    });
    return token;
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  logD("Handling a background message: ${message.messageId}");
}
