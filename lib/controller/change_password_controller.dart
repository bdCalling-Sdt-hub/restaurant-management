import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/service/api_service.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/utils/app_utils.dart';

class ChangePasswordController extends GetxController{
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  
  bool isLoading = false;

  Future<void> changePassword()async{
    isLoading = true;
    update();
    Map<String,String> body ={
      "oldPassword":oldPasswordController.text,
      "newPassword":newPasswordController.text,
      "confirmPassword":confirmPasswordController.text
    };
    var encodedBody = jsonEncode(body);
    var response =await ApiService.patchApi(ApiUrl.changePassword,body: encodedBody);

    print("================> ${response.responseJson}");

    if(response.statusCode==200){
      Utils.toastMessage(response.message);
      Get.offAllNamed(AppRoute.signin);
    }
    else{
      Utils.toastMessage(response.message);
    }

    isLoading = false;
    update();
  }
}