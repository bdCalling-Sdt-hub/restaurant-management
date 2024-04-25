import 'package:get/get.dart';
import 'package:restaurant_management/controller/auth/signin_controller.dart';
import 'package:restaurant_management/controller/profile_controller/personal_info_controller.dart';

import '../../controller/auth/signup_controller.dart';

class DependencyInjection extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => SignupController(),fenix: true);
    Get.lazyPut(() => PersonalInfoController(),fenix: true);

  }
}