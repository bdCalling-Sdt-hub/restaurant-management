import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/model/notification_model.dart';
import 'package:restaurant_management/service/api_service.dart';

class NotificationController extends GetxController{

  NotificationModel model =  NotificationModel();
  bool  isLoading = false;

  Future<void> notificationData()async{
    isLoading = true;
    update();
    var response = await ApiService.getApi(ApiUrl.notifications);

    if (kDebugMode) {
      print(response.responseJson);
    }
    if(response.statusCode==200){
      model = NotificationModel.fromJson(jsonDecode(response.responseJson));
    }
    isLoading = false;
    update();
  }


  @override
  void onInit() {

    notificationData();
    // TODO: implement onInit
    super.onInit();
  }
}