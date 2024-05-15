import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/model/home_model.dart';
import 'package:restaurant_management/service/api_service.dart';

class HomeController extends GetxController{
  List homeDataList = [];
  HomeModel homeModel =HomeModel();

  bool isLoading = false;
  Future<void> geHomeArrivalData () async{
    isLoading = true;
    update();
    var response = await ApiService.getApi(ApiUrl.homeEndPoint);

    print(response.responseJson);

    if(response.statusCode ==200){
      homeModel = HomeModel.fromJson(jsonDecode(response.responseJson));
      // print("jhdfasjhhjdsjhd}");
      // if(homeModel.data!.isNotEmpty){
      //   for(var data in homeModel.data!){
      //     homeDataList.add(data);
      //   }
      //   update();
      // }
      if (homeModel.data != null) {
        homeDataList.addAll(homeModel.data!);
        print("========================== length ${homeDataList.length}");
        update();

      }

    }
    isLoading = false;
    update();
  }



  @override
  void onInit() {
    geHomeArrivalData();
    // TODO: implement onInit
    super.onInit();
  }

}