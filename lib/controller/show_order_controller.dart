import 'dart:convert';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/model/show_order_model.dart';
import 'package:restaurant_management/service/api_service.dart';
import 'get_all_booking_data_controller.dart';

class ShowOrderController extends GetxController {
  GetAllBookingDataController controller =
      Get.put(GetAllBookingDataController());
  bool isLoading = false;
  ShowOrderModel model = ShowOrderModel();

  Future<void> showOrderData(String id) async {
    isLoading = true;
    update();
    var response = await ApiService.getApi("${ApiUrl.showOrder}/$id");
    print("================Response ${response.responseJson}");
    if (response.statusCode == 200) {
      update();
      model = ShowOrderModel.fromJson(jsonDecode(response.responseJson));
    }

    isLoading = false;
    update();
  }

  removeFromCart(
      {required String bookingId,
      required String itemId,
      required String amount,
      required String orderId}) async {
    var url = "${ApiUrl.removeList}/$bookingId";

    isLoading = true;
    update();

    print("============ URL$url");
    print(url);
    Map<String, String> body = {"itemId": itemId, "amount": amount};
    var enCodedBody = jsonEncode(body);
    print("=================BODY  $body");
    var response = await ApiService.patchApi(url, body: enCodedBody);
    print(response.responseJson);
    if (response.statusCode == 200) {
      await showOrderData(orderId);
      print(
          "=============ID ${controller.model.data?[0].sId.toString() ?? " "}");

      update();
      print(response.responseJson);
      print(response.message);
    }
    isLoading = false;
    update();
  }
}
