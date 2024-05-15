import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant_management/controller/profile_controller/edit_personal_info_controller.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/model/profile_model.dart';
import 'package:restaurant_management/service/api_service.dart';

class PersonalInfoController extends GetxController{

  ProfileModel model = ProfileModel();
  bool isLoading = false;
  String image = "";
  Future<void> getPersonalInfoData()async{
    isLoading  = true;
    update();
    var response = await ApiService.getApi(ApiUrl.profileInfo);
    if(response.statusCode==200){
      model = ProfileModel.fromJson(jsonDecode(response.responseJson));
      image = "${ApiUrl.imageUrl}${model.data?.image}" ?? "assets/images/profile_image.png";
    }
    isLoading = false;
    update();

  }
  // @override
  // void onInit() {
  //     getPersonalInfoData();
  //   // TODO: implement onInit
  //   super.onInit();
  // }
}