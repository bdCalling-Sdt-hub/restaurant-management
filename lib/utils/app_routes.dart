import 'dart:html';

import 'package:get/get.dart';
import 'package:restaurant_management/view/screens/cart_screen/cart_screen.dart';
import 'package:restaurant_management/view/screens/menu/menu_screen.dart';
import 'package:restaurant_management/view/screens/notification/notification_screen.dart';
import 'package:restaurant_management/view/screens/oder_details/order_details_screen.dart';
import '../view/screens/abou_us_screen/about_us_screen.dart';
import '../view/screens/favourite/favourite_screen.dart';
import '../view/screens/splash_screen/splash_screen.dart';

class AppRoute{
  static const String aboutUsScreen = "/about_us_screen";
  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/home_screen";
  static const String myorders = "/myorder_screen";
  static const String showMenu = "/menu_screen";
  static const String orderDetailsScreen = "/order_detaials_screen";
  static const String orderCartScreen = "/order_list_screen";
  static const String notification = "/notification_screen";
  static const String favourite = "/favourite_screen";

  static List<GetPage> routes = [
    GetPage(name: aboutUsScreen, page: () => const AboutUsScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: showMenu, page: () => const MenuScreen()),
    GetPage(name: orderDetailsScreen, page: () => const OrderDetailScreen()),
    GetPage(name: orderCartScreen, page: () => const CartScreen()),
    GetPage(name: notification, page: () => const NotificationScreen()),
    GetPage(name: favourite, page: () => const FavouriteScreen()),
  ];

}



