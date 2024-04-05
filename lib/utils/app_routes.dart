import 'package:get/get.dart';


import '../view/screens/abou_us_screen/about_us_screen.dart';
import '../view/screens/splash_screen/splash_screen.dart';

class AppRoute{
  static const String aboutUsScreen = "/about_us_screen";
  static const String splashScreen = "/splash_screen";


  static List<GetPage> routes = [
    GetPage(name: aboutUsScreen, page: () => const AboutUsScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
  ];

}



