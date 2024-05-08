import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/service/api_service.dart';

class ReviewController extends GetxController{
  TextEditingController commentController  = TextEditingController();

  Future<void> sentReview(String rating)async {

    Map<String, String> body = {
      "restaurant": "661f9fa80251120a07d13037",
      "rating": rating,
      "comment": commentController.text
    };
     var encodedBody  = jsonEncode(body);
    var response =await ApiService.postApi(ApiUrl.review, encodedBody);

    if (kDebugMode) {
      print(response.responseJson);
    }
  }
}