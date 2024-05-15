import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/model/order_details_model.dart';
import 'package:restaurant_management/service/api_service.dart';

import 'get_all_booking_data_controller.dart';

class OrderDetailsController extends GetxController{
  GetAllBookingDataController controller = Get.put(GetAllBookingDataController());
  OrderDetailsModel model = OrderDetailsModel();
  bool isLoading =false;
   Future<void> orderDetailsData(String id)async{
    isLoading = true;
    update();
     var response =await ApiService.getApi("${ApiUrl.orderDetails}$id");
     if(response.statusCode==200){
       orderDetailsData(controller.model.data?[0].sId.toString() ?? "");
       update();
       model = OrderDetailsModel.fromJson(jsonDecode(response.responseJson));
     }
 isLoading = false;
     update();
   }

  removeFromCart({required String bookingId,required  String itemId,required String amount})async{
    var url = "${ApiUrl.removeorderData}/$bookingId";
    print("============ URL$url");

    print(url);

    Map<String , String> body = {
      "itemId":itemId,
      "amount": amount
    };
    var enCodedBody = jsonEncode(body);

    print("=================BODY  $body");
    var response = await ApiService.patchApi(url,body: enCodedBody);

    print(response.responseJson);
    if(response.statusCode==200){
      //orderDetailsData(controller.model.data?[0].sId.toString() ?? "");
    //  update();

      print("=============ID ${controller.model.data?[0].sId.toString() ?? ""}");

      update();
      print(response.responseJson);
      print(response.message);
    }
  }

}