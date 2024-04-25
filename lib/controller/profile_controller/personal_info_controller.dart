import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/service/api_service.dart';

import '../../global/share_prefes_helper.dart';

class PersonalInfoController extends GetxController{


  Future<void> getPersonalInfoData()async{

    var response = await ApiService.getApi(ApiUrl.profileInfo);

    print(response.responseJson);
    print(response.statusCode);
  }
}