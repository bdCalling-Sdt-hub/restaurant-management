import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/model/all_booking_data_model.dart';
import 'package:restaurant_management/service/api_service.dart';

class GetAllBookingDataController extends GetxController{
  bool isLoading = false;
  GetAllBookingDataModel model = GetAllBookingDataModel();
  Future<void> getAllBookingDataModel ()async{
    isLoading = true;
    update();
    var response  = await ApiService.getApi(ApiUrl.bookingAllData);
    print(response.responseJson);

    if(response.statusCode==200){
      model = GetAllBookingDataModel.fromJson(jsonDecode(response.responseJson));
    }


    isLoading = false;
    update();

  }

  @override
  void onInit() {
    // TODO: implement onInit

    getAllBookingDataModel();
    super.onInit();
  }

}