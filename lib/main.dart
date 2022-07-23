// @dart=2.9

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:practice/controllers/user_provider/user_provider.dart';
import 'package:practice/services/local_notification_services/local_notification_service.dart';
import 'package:practice/utls/user_shared_preferences.dart';
import 'package:practice/views/welcomes/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'controllers/map_provider/map_provider.dart';
String api='AIzaSyB7nhCqDzMgY3Mbf4PX5ipHeM9oZErtwB8';
Future<void> backgroundHandler(RemoteMessage message) async{

  print(message.data.toString());
  print(message.notification.body);
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
 await Firebase.initializeApp();
  LocalNotificationServices.initialize();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await UserSharedPreferences.init();
  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: UserProvider(), ),
      ChangeNotifierProvider.value(value: ProviderMaps(), ),
    ],
    child: const GetMaterialApp(
      home:SplashScreen(),
      debugShowCheckedModeBanner: false,
    ),
  ));

}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}