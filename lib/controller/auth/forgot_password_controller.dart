import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/global/share_prefes_helper.dart';
import 'package:restaurant_management/service/api_service.dart';
import 'package:restaurant_management/utils/app_routes.dart';

import '../../utils/app_utils.dart';

class ForgotPasswordController extends GetxController{
  
  TextEditingController emailController =  TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> forgotPassRepo ()async{
    
    Map<String,String> body = {
      "email" : emailController.text
     //"email" : PrefsHelper.email
    };

    print(body);
    var enCodedbody =  jsonEncode(body);
    var response =  await ApiService.patchApi(ApiUrl.forgotPass,body: enCodedbody);

    print(response.responseJson);

    if(response.statusCode==200){
      Utils.toastMessage(response.message);
      Get.toNamed(AppRoute.otpVerify);

    }
    else{
      Utils.toastMessage(response.message);
    }
    
  }
  
}