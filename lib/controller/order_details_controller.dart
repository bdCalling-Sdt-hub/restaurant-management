import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/model/order_details_model.dart';
import 'package:restaurant_management/service/api_service.dart';

class OrderDetailsController extends GetxController{
  OrderDetailsModel model = OrderDetailsModel();
  bool isLoading =false;
   Future<void> orderDetailsData(String id)async{
    isLoading = true;
    update();
     var response =await ApiService.getApi("${ApiUrl.orderDetails}$id");

     if(response.statusCode==200){
       model = OrderDetailsModel.fromJson(jsonDecode(response.responseJson));
     }
 isLoading = false;
     update();
   }
}