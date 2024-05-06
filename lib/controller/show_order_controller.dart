import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/model/show_order_model.dart';
import 'package:restaurant_management/service/api_service.dart';

class ShowOrderController extends GetxController{
ShowOrderModel model = ShowOrderModel();
  bool isLoading = false;
  Future<void> showOrderData(String id)async{
    isLoading = true;
    update();
    var response = await ApiService.getApi("${ApiUrl.showOrder}/$id");
    if(response.statusCode==200){
    model = ShowOrderModel.fromJson(jsonDecode(response.responseJson));
    }

    isLoading = false;
    update();
  }
}