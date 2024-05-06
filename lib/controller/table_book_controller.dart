import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_management/global/share_prefes_helper.dart';
import 'package:restaurant_management/model/after_booked_table_model.dart';
import 'package:restaurant_management/model/get_booked_data_model.dart';
import 'package:restaurant_management/model/table_book_model.dart';
import 'package:restaurant_management/utils/app_utils.dart';
import '../global/api_url_container.dart';
import '../service/api_service.dart';
import '../utils/app_routes.dart';
import '../view/screens/table_booking_screen/inner_screen/book_now.dart';

class TableBookController extends GetxController{
  TableBookModel tableBookModel = TableBookModel();
  String ? data;

  bool isLoading = false;
  Future<void> getTableData(String id) async{
  isLoading = true;
  update();
    var response = await ApiService.getApi("${ApiUrl.getTableData}/$id");
    if(response.statusCode==200){
      tableBookModel = TableBookModel.fromJson(jsonDecode(response.responseJson));
      print(response.statusCode);
      print("response.responseJson ========>> ${response.responseJson}");
      data = tableBookModel.data?.location.toString() ?? "";
      id= tableBookModel.data?.sId.toString() ?? "";
      Get.toNamed(AppRoute.tableBooking);
      print("=========== ID >>> ${id}");
    }else{
      print(response.statusCode);
    }
  isLoading = false;
  update();

  }
///=========================BookedTable =====================//

  TextEditingController personNoController = TextEditingController();
  AfterBookTableModel afterBookTableModel = AfterBookTableModel();

    Future<void> bookTable(String rid) async{
      isLoading = true;
      update();

    Map<String ,String> body = {
      "restaurant":rid.toString(),
      "date":validationController.text,
      "time": selectedTime.toString(),
      "seats":personNoController.text
    };
    var encodedBody = jsonEncode(body);

    var response = await ApiService.postApi(ApiUrl.bookingTable, encodedBody);
   if(response.statusCode ==200 ){
     PrefsHelper.setString("afterbookingId", jsonDecode(response.responseJson)['data']['_id']);
     PrefsHelper.afterbookingId = jsonDecode(response.responseJson)['data']['_id'];
    print("===============bookingId>    ${PrefsHelper.afterbookingId}");

    Utils.toastMessage(response.message);

    getBookedData(bookingId: PrefsHelper.afterbookingId);
     Get.to(const BookNow());
   }
   else{
     Utils.toastMessage(response.message);
   }
    if (kDebugMode) {
      print(response.responseJson);
    }

      isLoading = false;
      update();
  }

  ///=========================Get after booked data  =====================//

  GetBookedDataModel getBookedDataModel = GetBookedDataModel();

  Future<void> getBookedData ({required String bookingId}) async{
    isLoading = true;
    update();
      var response = await  ApiService.getApi("${ApiUrl.bookingTable}/$bookingId");
      if(response.statusCode==200){
        getBookedDataModel = GetBookedDataModel.fromJson(jsonDecode(response.responseJson));
        print(getBookedDataModel.data?.table?.tableName);
      }
    isLoading = false;
    update();
  }

  /// ====================== Date picker ====================///



  TextEditingController validationController = TextEditingController();
  Future<void> validationTimePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Colors.green, // Change primary color as needed
            onPrimary: Colors.white, // Change text color as needed
            onSurface: Colors.black, // Change text color as needed
          ),
        ),
        child: child!,
      ),
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      final formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(picked.toUtc());
      validationController.text = formattedDate;
      update();
    }
  }


  ///=======================TimePicker ===================///

  String ? selectedTime;
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Colors.green, // Change primary color as needed
            onPrimary: Colors.white, // Change text color as needed
            onSurface: Colors.black, // Change text color as needed
          ),
        ),
        child: child!,
      ),
    );

    if (pickedTime != null) {
      selectedTime = '${pickedTime.hour}:${pickedTime.minute}';
      print(selectedTime);
      update();
    }
  }

}