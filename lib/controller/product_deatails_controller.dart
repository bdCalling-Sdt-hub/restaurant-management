import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/model/menu_details_model.dart';
import '../global/api_url_container.dart';
import '../service/api_service.dart';

class ProductDetailsController extends GetxController{
MenuDetailsModel model =  MenuDetailsModel();

bool isLoading =  false;
  Future<void> menuDetails (String id) async{

    isLoading = true;
    update();
    var response  =  await ApiService.getApi("${ApiUrl.menuEndPoint}/$id");
    if (kDebugMode) {
      print(response.responseJson);
    }
    if(response.statusCode==200){
      model = MenuDetailsModel.fromJson(jsonDecode(response.responseJson));
      print(model.data?.name);
    }
    isLoading = false;
    update();
  }


  int initialQuantity = 1 ;

  incrementQuantity(){
    initialQuantity++;
    update();
  }
  decrementQuantity(){
    if(initialQuantity>1)
    {
      initialQuantity--;
      update();
    }

  }

  Future<void> sendAmount()async{


    Map<String,String> body ={

    };

  }

}