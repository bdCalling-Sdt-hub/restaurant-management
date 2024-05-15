import 'dart:convert';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/service/api_service.dart';
import '../model/restaurant_wise_review_model.dart';
class RestaurantWiseReviewController extends GetxController{
  RestaurantWiseReviewModel model = RestaurantWiseReviewModel();
  bool isLoading  = false;

  Future<void> getAllReviews({required String restaurantId })async{
    isLoading = true;
    update();
    var response  = await ApiService.getApi("${ApiUrl.allReview}/$restaurantId");
     if(response.statusCode==200){
       model = RestaurantWiseReviewModel.fromJson(jsonDecode(response.responseJson));
       print("==================Model data  ${response.responseJson}");
     }
   isLoading = false;
     update();
  }
}