import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../utls/utls.dart';

class LocalNotificationServices {
  static final FlutterLocalNotificationsPlugin _notificationPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(android: AndroidInitializationSettings(''));
    _notificationPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage message) async {
  try{
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "practice",
          "practice channel",
          importance: Importance.max,
          priority: Priority.high,
        ));
    _notificationPlugin.show(id, message.notification!.body,
        message.notification!.title, notificationDetails);
  }
  on Exception catch(e){
    logger.e(e);
  }

  }
}
