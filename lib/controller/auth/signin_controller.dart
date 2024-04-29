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
  TextEditingController emailController =  TextEditingController(text: kDebugMode?"vecexoc215@idsho.com" : "");
  TextEditingController passwordController =  TextEditingController(text: kDebugMode?"111222" : "");
  final formKey = GlobalKey<FormState>();
  RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool isLoading = false;
  Future<void> signInRepo()async {

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

        // emailController.clear();
        // passwordController.clear();
        Get.offAllNamed(AppRoute.homeScreen);
        Utils.toastMessage(response.message);



      ///-----------------------Save data in sharePrefs ----------------------->>
        PrefsHelper.setString("accessToken", jsonDecode(response.responseJson)['data']['accessToken']);
        PrefsHelper.setString("refreshToken", jsonDecode(response.responseJson)['data']['refreshToken']);

        PrefsHelper.accessToken = jsonDecode(response.responseJson)['data']['accessToken'];
        PrefsHelper.refreshToken = jsonDecode(response.responseJson)['data']['refreshToken'];

        if (kDebugMode) {
          print("=============Token    >>>>>>>>>>> ${jsonDecode(response.responseJson)['data']['accessToken']}");
        }


        
      }
      else{
        Utils.toastMessage(response.message);
      }
    }

}