import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/service/api_service.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/view/screens/auth/reset_password_scree/reset_password_screen.dart';
import 'package:restaurant_management/view/screens/auth/verify_code_screen/verify_code_forgot.dart';

import '../../global/share_prefes_helper.dart';
import '../../utils/app_utils.dart';

class ForgotPasswordController extends GetxController{
  
  TextEditingController emailController =  TextEditingController();
  TextEditingController otpController =  TextEditingController();
  TextEditingController newPassController =  TextEditingController();
  TextEditingController confirmPassController =  TextEditingController();
  final formKey = GlobalKey<FormState>();
bool isForgot = false;
 bool isLoading = false;


///-------------forgot password------------------>
  Future<void> forgotPassRepo ()async{
    isLoading = true;
    update();
    Map<String,String> body = {
      "email" : emailController.text
    };

    var enCodedbody1 =  jsonEncode(body);

    var response =  await ApiService.patchApi(ApiUrl.forgotPass,body: enCodedbody1);

    print(response.responseJson);

    if(response.statusCode==200){
      Utils.toastMessage(response.message);

      Get.to(VerifyCodeForgot());

      PrefsHelper.setString("forgotToken", jsonDecode(response.responseJson)['data']['token']);
      PrefsHelper.forgotToken = jsonDecode(response.responseJson)['data']['token'];

      emailController.clear();

      if (kDebugMode) {
        print(jsonDecode(response.responseJson)['data']['token']);
      }

    }
    else{
      Utils.toastMessage(response.message);
      emailController.clear();
    }
    isLoading = false;
    update();
    
  }
  ///-------------verify otp------------------>
  Future<void> verifyOtp() async{
    isLoading = true;
    update();
    Map<String,String> body ={
      "otp" : otpController.text
    };

    Map<String,String> headers = {
      "token" : PrefsHelper.forgotToken,
      'Content-Type': 'application/json'
    };


    print("=========Headers>>>>>>>> $headers");


    var encodedBody = jsonEncode(body);
    var response = await ApiService.postApi(ApiUrl.otpVerify, encodedBody,header:  headers);

    if (kDebugMode) {
      print("response Data ${response.responseJson}");
    }

    if (kDebugMode) {
      print("=====================================>response ${response.responseJson}");
      print("=====================================>response ${response.message}");
    }


    if(response.statusCode==200){
      Get.to(ResetPassword());
      otpController.clear();
      Utils.toastMessage(response.message);
    }
    else{
      otpController.clear();
      Utils.toastMessage(response.message);
    }
    isLoading = false;
    update();
  }


  ///-----------------------resent otp------------------------>

  Future<void> resendOtp() async{
    isLoading = true;
    update();
    Map<String,String> body = {
      "email" : emailController.text
    };

    var encodedBody =  jsonEncode(body);

    var response  = await ApiService.postApi(ApiUrl.resendOtp, encodedBody);
    if(response.statusCode==200){
      otpController.clear();
      Utils.toastMessage(response.message);
    }else{
      otpController.clear();
      Utils.toastMessage(response.message);
    }

    if (kDebugMode) {
      print("=====================================>response $encodedBody");
      // print("=====================================>response $header");
    }
    if (kDebugMode) {
      print(response.responseJson);
    }
    isLoading = false;
    update();
  }

  ///----------------------reset password---------------------->
  Future<void> resetPassword ()async{
    isLoading = true;
    update();
    Map<String,String> body ={
      "newPassword":newPassController.text,
      "confirmPassword":confirmPassController.text
    };

    Map<String,String> header ={
      "token":PrefsHelper.forgotToken,
      'Content-Type': 'application/json',
    };
    var encodedBody =  jsonEncode(body);
    var response = await ApiService.patchApi(ApiUrl.resetPAss,body: encodedBody,header: header);
    if (kDebugMode) {
      print(response.responseJson);
    }

    if(response.statusCode==200){
      Get.offAndToNamed(AppRoute.signin);
      Utils.toastMessage(response.message);
      clearData();
    }
    else{
      Utils.toastMessage(response.message);
      clearData();
    }
    isLoading = false;
    update();
  }

  clearData(){
    newPassController.clear();
    confirmPassController.clear();
  }

}