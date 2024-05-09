import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/service/api_service.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/utils/app_utils.dart';

import '../../global/share_prefes_helper.dart';

class SignInController extends GetxController{
  TextEditingController emailController =  TextEditingController(text: kDebugMode?"mikera2652@ahieh.com" : "");
  TextEditingController passwordController =  TextEditingController(text: kDebugMode?"111222" : "");

  final formKey = GlobalKey<FormState>();
  RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool isLoading = false;
  Future<void> signInRepo()async {
 isLoading = true;
 update();
    Map<String,String> body = {
      "email":emailController.text,
      "password":passwordController.text
    };
     var encodedBody =  jsonEncode(body);
     var response = await ApiService.postApi(ApiUrl.signIn, encodedBody);

    if (kDebugMode) {
      print(response.responseJson);
    }
      if(response.statusCode == 200){
        Get.offAllNamed(AppRoute.homeScreen);
        Utils.toastMessage(response.message);

      ///-----------------------Save data in sharePrefs ----------------------->>
        PrefsHelper.setString("accessToken", jsonDecode(response.responseJson)['data']['accessToken']);
        PrefsHelper.setString("refreshToken", jsonDecode(response.responseJson)['data']['refreshToken']);
        PrefsHelper.setString("userId", jsonDecode(response.responseJson)['data']["user"]['_id']);

        PrefsHelper.accessToken = jsonDecode(response.responseJson)['data']['accessToken'];
        PrefsHelper.refreshToken = jsonDecode(response.responseJson)['data']['refreshToken'];
        PrefsHelper.userId = jsonDecode(response.responseJson)['data']["user"]['_id'];

        print("USer Id  ================ ID${PrefsHelper.userId}");



        if (kDebugMode) {
          print("=============Token    >>>>>>>>>>> ${jsonDecode(response.responseJson)['data']['accessToken']}");
          print("USer Id  ================ ID${PrefsHelper.userId}");
        }


        
      }
      else{
        Utils.toastMessage(response.message);
      }
 isLoading = false;
 update();
    }

}