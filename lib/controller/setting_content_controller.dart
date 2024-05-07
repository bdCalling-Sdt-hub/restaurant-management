import 'dart:convert';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/service/api_service.dart';
import '../model/setting_contents_model.dart';
class SettingContentController extends GetxController{
  bool isLoading = false;
  SettingContenModel model = SettingContenModel();
  Future<void> settingContent (String endPoint)async{
    isLoading = true;
    update();
    var response  =await ApiService.getApi("${ApiUrl.settingContent}?select=$endPoint");
    print(response.responseJson);

    if(response.statusCode==200){
      model = SettingContenModel.fromJson(jsonDecode(response.responseJson));
    }
    isLoading = false;
    update();
  }
}