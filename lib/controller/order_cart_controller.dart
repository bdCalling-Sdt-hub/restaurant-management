import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/model/card_list_model.dart';
import '../global/api_url_container.dart';
import '../service/api_service.dart';

class OrderCartController extends GetxController {
  CardListModel model = CardListModel();
  Future<void> getAllCartData (String menuId)async {
    var url = "${ApiUrl.allCart}/$menuId";
    var response  = await ApiService.getApi(url);
    if (kDebugMode) {
      print("asdfhu aslkdjfh ;asdkfjh dfk ==================>${response.responseJson}");
    }

    if(response.statusCode==200){
      model = CardListModel.fromJson(jsonDecode(response.responseJson));
      print(response.statusCode);
      print(response.message);
      print(response.responseJson);

    }
  }

  int initialQuantity = 1;

  incrementQuantity() {
    initialQuantity++;
    update();
  }

  decrementQuantity() {
    initialQuantity--;
    update();
  }
}
