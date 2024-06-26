import 'package:get/get.dart';
import 'package:restaurant_management/view/screens/auth/signin_screen/signin_screen.dart';
import 'package:restaurant_management/view/screens/auth/signup_screen/signup_screen.dart';
import 'package:restaurant_management/view/screens/auth/verify_code_screen/verify_code.dart';
import 'package:restaurant_management/view/screens/booking_details_screen/booking_details_screen.dart';
import 'package:restaurant_management/view/screens/booking_details_screen/inner_screen/show_order_screen.dart';
import 'package:restaurant_management/view/screens/cart_screen/cart_screen.dart';
import 'package:restaurant_management/view/screens/home_screen/home_screen.dart';
import 'package:restaurant_management/view/screens/menu/menu_screen.dart';
import 'package:restaurant_management/view/screens/notification/notification_screen.dart';
import 'package:restaurant_management/view/screens/profile/profile_screen.dart';
import 'package:restaurant_management/view/screens/settings/setting_screen.dart';
import 'package:restaurant_management/view/screens/table_booking_screen/table_booking_screen.dart';
import 'package:restaurant_management/view/screens/welcome_screen/welcome_screen.dart';
import 'package:restaurant_management/view/widgets/no_internet.dart';
import '../view/screens/abou_us_screen/about_us_screen.dart';
import '../view/screens/edit_personal_info/edit_personal_info.dart';
import '../view/screens/favourite/favourite_screen.dart';
import '../view/screens/menu_oder_details/menu_order_details_screen.dart';
import '../view/screens/order_details_screen/order_details_screen.dart';
import '../view/screens/payment_screen/payment_screen.dart';
import '../view/screens/restaurant_wise_review_screen/restaurant_wise_review_screen.dart';
import '../view/screens/review_screen/review_screen.dart';
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
  static const String profile = "/profile_screen";
  static const String setting = "/setting_screen";
  static const String welcome = "/welcome_screen";
  static const String signup = "/signup_screen";
  static const String signin = "/signin_screen";
  static const String otpVerify = "/otpVerify_screen";
  static const String noInternet = "/noInternet_screen";
  static const String editProfile = "/editProfile_screen";
  static const String tableBooking = "/tableBooking_screen";
  static const String bookingDetails = "/bookingDetails_screen";
  static const String orderDetailsEcreen = "/OrderDetailsEcreen_screen";
  static const String showOrderScreen = "/showOrderScreen_screen";
  static const String paymentScreen = "/paymentScreenscreen";
  static const String reviewScreen = "/review_screen";
  static const String restauratnWiseReviewScreen = "/RestauratnWiseReviewScreen";

  static List<GetPage> routes = [

    GetPage(name: aboutUsScreen, page: () => const AboutUsScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: showMenu, page: () => const MenuScreen()),
    GetPage(name: orderDetailsScreen, page: () => const OrderDetailScreen()),
    GetPage(name: orderCartScreen, page: () => const CartScreen()),
    GetPage(name: notification, page: () => const NotificationScreen()),
    GetPage(name: favourite, page: () => const FavouriteScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: setting, page: () => const SettingScreen()),
    GetPage(name: welcome, page: () => const WelcomeScreen()),
    GetPage(name: signup, page: () =>  const SignupScreen()),
    GetPage(name: signin, page: () => const SigninScreen()),
    GetPage(name: otpVerify, page: () =>  VerifyCodeScreen()),
    GetPage(name: noInternet, page: () =>  const NoInternet()),
    GetPage(name: editProfile, page: () =>   EditPersonalInfo()),
    GetPage(name: tableBooking, page: () =>   const TableBookingScreen()),
    GetPage(name: bookingDetails, page: () =>   const BookingDetailsScreen()),
    GetPage(name: orderDetailsEcreen, page: () =>    OrderDetailsEcreen()),
    GetPage(name: showOrderScreen, page: () =>   const ShowOrderScreen()),
    GetPage(name: paymentScreen, page: () =>   const PaymentScreen()),
    GetPage(name: reviewScreen, page: () =>   const ReviewScreen()),
    GetPage(name: restauratnWiseReviewScreen, page: () =>   const RestauratnWiseReviewScreen()),

  ];

}



