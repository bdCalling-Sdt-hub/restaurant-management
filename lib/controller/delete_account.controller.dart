
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/global/share_prefes_helper.dart';
import 'package:restaurant_management/service/api_service.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/utils/app_utils.dart';

class DeleteAccount extends GetxController{
  TextEditingController passwordController = TextEditingController();
bool isLoading  = false;

Future<void> deleteAccount () async{
  Map<String,String > body ={
        "password" : passwordController.text
  };
  print(body);
  Map<String,String > header ={
    'Authorization' : "Bearer ${PrefsHelper.accessToken}",
    'Content-Type': 'application/json'
  };
  var encodedBody = jsonEncode(body);
  var response =await ApiService.deleteApi(ApiUrl.deleteAccount,body:  encodedBody,header: header);

  print("===========response${response.responseJson}");

  if(response.statusCode==200){
    Utils.toastMessage(response.message);
    Get.offAllNamed(AppRoute.signin);
  }
  else{
    Utils.toastMessage(response.message);
  }

}

}