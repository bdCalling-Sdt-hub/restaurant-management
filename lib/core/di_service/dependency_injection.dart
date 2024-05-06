
import 'package:get/get.dart';
import 'package:restaurant_management/controller/auth/signin_controller.dart';
import 'package:restaurant_management/controller/change_password_controller.dart';
import 'package:restaurant_management/controller/delete_account.controller.dart';
import 'package:restaurant_management/controller/home_controller.dart';
import 'package:restaurant_management/controller/profile_controller/personal_info_controller.dart';
import '../../controller/auth/signup_controller.dart';
import '../../controller/booking_status_controller.dart';
import '../../controller/get_all_booking_data_controller.dart';
import '../../controller/menu_controller.dart';
import '../../controller/order_cart_controller.dart';
import '../../controller/single_booking_controller.dart';
import '../../controller/table_book_controller.dart';

class DependencyInjection extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => SignupController(),fenix: true);
    Get.lazyPut(() => PersonalInfoController(),fenix: true);
    Get.lazyPut(() => HomeController(),fenix: true);
    Get.lazyPut(() => ChangePasswordController(),fenix: true);
    Get.lazyPut(() => DeleteAccount(),fenix: true);
    Get.lazyPut(() => TableBookController(),fenix: true);
    Get.lazyPut(() => MenuControllerGet(),fenix: true);
    Get.lazyPut(() => OrderStatusController(),fenix: true);
    Get.lazyPut(() => OrderCartController(),fenix: true);
    Get.lazyPut(() => GetAllBookingDataController(),fenix: true);
    Get.lazyPut(() => GetSingleBookingController(),fenix: true);
  }
}