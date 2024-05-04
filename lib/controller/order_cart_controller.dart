import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/share_prefes_helper.dart';
import 'package:restaurant_management/model/card_list_model.dart';
import '../global/api_url_container.dart';
import '../service/api_service.dart';

class OrderCartController extends GetxController {
  CardListModel model = CardListModel();
  List carList =  [];
  bool isLoading = false;
  Future<void> getAllCartData (String bookingId)async {
    isLoading = true;
    update();
    carList.clear();
    var url = "${ApiUrl.allCart}/$bookingId";
    var response  = await ApiService.getApi(url);
    if (kDebugMode) {
      print(" ==================>${response.responseJson}");
    }

    if(response.statusCode==200){
       getAllCartData(PrefsHelper.afterbookingId);
      model = CardListModel.fromJson(jsonDecode(response.responseJson));

      if(model.data?.items != null){
        carList.addAll(model.data!.items!);
        update();
      }
      print(response.statusCode);
      print(response.message);
      print(response.responseJson);
      print(carList.length);

    }
    isLoading = false;
    update();
  }

  removeFromCart(String id,String amount)async{
    var url = "${ApiUrl.removeData}/${PrefsHelper.afterbookingId}";

    print(url);

    Map<String , String> body = {
      "itemId":id,
      "amount": amount
    };
    var enCodedBody = jsonEncode(body);

    print("=================$enCodedBody");
    var response = await ApiService.patchApi(url,body: enCodedBody);

    print(response.responseJson);
    if(response.statusCode==200){
      print(response.responseJson);
      print(response.message);
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
