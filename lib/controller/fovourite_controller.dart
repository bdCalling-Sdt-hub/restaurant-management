import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/model/all_fovaourite_model.dart';
import 'package:restaurant_management/service/api_service.dart';

class FavouriteController extends GetxController{
  AllFavouriteModel model = AllFavouriteModel();
  bool isLoading = false;

  Future<void> favouriteData()async{
    isLoading = true;
    update();
    var response  = await ApiService.getApi(ApiUrl.allFavourite);
    print(response.responseJson);
    if(response.statusCode ==200){
      model = AllFavouriteModel.fromJson(jsonDecode(response.responseJson));
    }
    isLoading = false;
    update();
  }
  @override
  void onInit() {
    favouriteData();
    update();
    // TODO: implement onInit
    super.onInit();
  }
}