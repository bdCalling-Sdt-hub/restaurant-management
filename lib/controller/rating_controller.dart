import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/service/api_service.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/utils/app_utils.dart';

class ReviewController extends GetxController{
  TextEditingController commentController  = TextEditingController();
bool isLoading = false;

  Future<void> sentReview(String rating,String restaurantId)async {
    isLoading = true;
    update();

    Map<String, String> body = {
      "restaurant": restaurantId,
      "rating": rating,
      "comment": commentController.text
    };
     var encodedBody  = jsonEncode(body);
     print("=================Body $body");
    var response =await ApiService.postApi(ApiUrl.review, encodedBody);

    if (kDebugMode) {
      print(response.responseJson);
    }

    if(response.statusCode==200){
      Utils.toastMessage("Thanks for your valuable review");
      Get.offAllNamed(AppRoute.homeScreen);

    }
    isLoading = false;
    update();
  }
}