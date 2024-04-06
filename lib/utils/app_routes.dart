import 'package:get/get.dart';
import 'package:restaurant_management/view/screens/menu/menu_screen.dart';
import 'package:restaurant_management/view/screens/my_orders/my_order_screen.dart';
import '../view/screens/abou_us_screen/about_us_screen.dart';
import '../view/screens/splash_screen/splash_screen.dart';

class AppRoute{
  static const String aboutUsScreen = "/about_us_screen";
  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/home_screen";
  static const String myorders = "/myorder_screen";
  static const String showMenu = "/menu_screen";

  static List<GetPage> routes = [
    GetPage(name: aboutUsScreen, page: () => const AboutUsScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: showMenu, page: () => const MenuScreen()),
  ];

}



