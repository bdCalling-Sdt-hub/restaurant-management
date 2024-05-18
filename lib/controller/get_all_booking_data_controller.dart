import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/model/all_booking_data_model.dart';
import 'package:restaurant_management/service/api_service.dart';

class GetAllBookingDataController extends GetxController {
  bool isLoading = false;
  GetAllBookingDataModel model = GetAllBookingDataModel();
  List status = ["active", "cancelled", "closed"];

  List dataList = [];

  Future<void> getAllBookingDataModel(int index) async {
    isLoading = true;
    update();
    dataList.clear();
    var response = await ApiService.getApi(
        "${ApiUrl.bookingAllData}?status=${status[index]}");
    print(response.responseJson);

    if (response.statusCode == 200) {
      model =
          GetAllBookingDataModel.fromJson(jsonDecode(response.responseJson));
      if (model.data != null) {
        dataList.addAll(model.data!);
      }
    }

    isLoading = false;
    update();
  }
}
