import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/service/notification_service.dart';
import 'package:restaurant_management/service/socket_service.dart';
import 'package:restaurant_management/utils/app_routes.dart';

import 'core/di_service/dependency_injection.dart';

void main(){
  DependencyInjection di = DependencyInjection();
  di.dependencies();

  NotificationService notificationService = NotificationService();
  SocketServices.connectToSocket();
  notificationService.initLocalNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splashScreen,
      navigatorKey: Get.key,
      getPages: AppRoute.routes,
    );
  }
}
