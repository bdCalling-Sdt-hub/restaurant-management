import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant_management/model/booking_status_model.dart';

import '../global/api_url_container.dart';
import '../service/api_service.dart';

class BookingStatusController extends GetxController{

  BookingStatusModel model =BookingStatusModel();
  bool isLoading = false;
  Future<void> bookingData ()async{
    isLoading = true;
    update();
    var response = await ApiService.getApi(ApiUrl.bookingStatus);
    print("===================Menu Response${response.responseJson}");
    if(response.statusCode==200){
      model  = BookingStatusModel.fromJson(jsonDecode(response.responseJson));
      update();
      print(response.responseJson);
      print(response.message);
    }

    isLoading = false;
    update();
  }

  @override
  void onInit() {
    bookingData();
    update();
    // TODO: implement onInit
    super.onInit();
  }
}