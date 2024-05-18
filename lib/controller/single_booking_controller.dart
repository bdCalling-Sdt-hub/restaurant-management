import 'dart:convert';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/model/single_booking_model.dart';
import 'package:restaurant_management/service/api_service.dart';

class GetSingleBookingController extends GetxController {
  GetSingleBookingModel model = GetSingleBookingModel();
  String tableName = "";
  bool isLoading = false;

  Future<void> getSingleBookingData(String id, int index) async {
    isLoading = true;
    update();
    var response = await ApiService.getApi("${ApiUrl.getSingleBooking}/$id");
    if (response.statusCode == 200) {
      model = GetSingleBookingModel.fromJson(jsonDecode(response.responseJson));
      update();
      print("================Booking Data${response.responseJson}");
      tableName = model.data?[0].table?.tableName ?? "";
      print("================ Data${model.data?[0].table?.tableName}");
      print("================ NAme ${model.data?[0].table?.tableName}");
    }
    isLoading = false;
    update();
  }
// @override
// void onInit() {
//   getSingleBookingData("", 0);
//   // TODO: implement onInit
//   super.onInit();
// }
}
