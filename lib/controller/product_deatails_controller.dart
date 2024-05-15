import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/share_prefes_helper.dart';
import 'package:restaurant_management/model/add_favourite_model.dart';
import 'package:restaurant_management/model/menu_details_model.dart';
import '../global/api_url_container.dart';
import '../service/api_service.dart';

class ProductDetailsController extends GetxController{
MenuDetailsModel model =  MenuDetailsModel();

bool isLoading =  false;
  Future<void> menuDetails (String id) async{
    if(model.data?.name == null){
      isLoading = true;
      update();
    }

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

  ///========================add to favourite ==========================>>>
AddFavoriteModel addFavoriteModel =  AddFavoriteModel();

  RxBool isFavourite = false.obs;
Future<void> addFavourite(String menuId)async{
    Map<String,String> body ={
      "id": menuId
    };
    var  encodeBody = jsonEncode(body);
  var response =  await ApiService.postApi(ApiUrl.addFavourite, encodeBody);
    if (kDebugMode) {
      print(response.responseJson);
    }
    if(response.statusCode==200){
      addFavoriteModel = AddFavoriteModel.fromJson(jsonDecode(response.responseJson));
      isFavourite.value = addFavoriteModel.data?.isFavorite ?? true;
     // menuDetails(menuId);
    }
}

///=========================Sent order / quantity and amount ============================>>>

sentOrderMenu({required String menuId,required int initialQuality,required int amount,required  String ownerId})async{
  Map<String , dynamic > body ={
    "menu":menuId,
    "quantity": initialQuality,
    "amount":amount,
    "owner": ownerId
  };
  print("===================BODY$body");
  var encodeBody  = jsonEncode(body);
   String url  = "${ApiUrl.addCart}/${PrefsHelper.afterbookingId}";
  var response  = await ApiService.postApi( url,encodeBody);
  print("response ==============>${response.responseJson}");

  if(response.statusCode==200){
    print(response.statusCode);
    print(response.message);
    print(response.responseJson);
  }

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

}