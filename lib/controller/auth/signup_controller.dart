import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/utils/app_utils.dart';
import 'package:restaurant_management/view/screens/auth/reset_password_scree/reset_password_screen.dart';
import '../../global/api_url_container.dart';
import '../../global/share_prefes_helper.dart';
import '../../service/api_service.dart';
import '../../utils/app_routes.dart';


class SignupController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController  = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController otpController = TextEditingController();

  RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp passRegExp = RegExp(r'(?=.*[a-z])(?=.*[0-9])');

  final formKey = GlobalKey<FormState>();
  String  otpToken = "";
 bool isLoading = false;

  ///-----------------------OtpVerify------------------------>
 Future<void> signUpRepo() async {
    isLoading = true;
    update();
    Map<String, String> body = {
      "fullName": nameController.text,
      "email": emailController.text,
      "phoneNumber": phoneNumberController.text,
      "password": passwordController.text
    };
    Map<String, String> mainHeader = {
      'Content-Type': 'application/json'
    };
    var encodeBody = jsonEncode(body);

    var response = await ApiService.postApi(ApiUrl.signUp, encodeBody,header: mainHeader);

    if (kDebugMode) {
      print("response Data ${response.responseJson}");
    }

    if (kDebugMode) {
      print("=====================================>response ${response.responseJson}");
      print("=====================================>response ${response.message}");
    }

    if (response.statusCode == 200) {

      otpToken = jsonDecode(response.responseJson)['data']['token'];

      PrefsHelper.setString("token", jsonDecode(response.responseJson)['data']['token']);
      PrefsHelper.setString("email", jsonDecode(response.responseJson)['data']['user']['email']);


      PrefsHelper.otpToken = jsonDecode(response.responseJson)['data']['token'];
      PrefsHelper.email = jsonDecode(response.responseJson)['data']['user']['email'];

      print(response.responseJson);
      Get.toNamed(AppRoute.otpVerify);
    } else {
     // Utils.toastMessage(response.message);
      print(response.statusCode);
    }

    isLoading = false;
    update();
  }
///-----------------------OtpVerify------------------------>
 Future<void> verifyOtp() async{
   isLoading = true;
   update();
   Map<String,String> body ={
     "otp" : otpController.text
   };

   Map<String,String> header = {
     "token" : PrefsHelper.otpToken,
     'Content-Type': 'application/json'
   };



   print("=========Header>>>>>>>> $header");


   var encodedBody = jsonEncode(body);
   var response = await ApiService.postApi(ApiUrl.otpVerify, encodedBody,header: header);

   if (kDebugMode) {
     print("response Data ${response.responseJson}");
   }

   if (kDebugMode) {
     print("=====================================>response ${response.responseJson}");
     print("=====================================>response ${response.message}");
   }


   if(response.statusCode==200){
     Get.offAndToNamed(AppRoute.signin);
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
  Map<String,String> header = {
    "token" : PrefsHelper.otpToken,
    'Content-Type': 'application/json'
  };



  print("=========Header>>>>>>>> $header");


   Map<String,String> body = {
     "email" : PrefsHelper.email
   };

   var encodedBody =  jsonEncode(body);


   var response  = await ApiService.postApi(ApiUrl.resendOtp, encodedBody,header: header);
   if(response.statusCode==200){
     otpController.clear();
     Utils.toastMessage(response.message);
   }else{
     otpController.clear();
     Utils.toastMessage(response.message);
   }

   if (kDebugMode) {
     print("=====================================>response $encodedBody");
     print("=====================================>response $header");
   }
   if (kDebugMode) {
     print(response.responseJson);
   }
  isLoading = false;
  update();
}



}