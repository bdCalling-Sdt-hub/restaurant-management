import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class TableBookController extends GetxController{

  /// ====================== Date picker====================/
  DateTime? startDate;
  TimeOfDay? selectedTime;

  TextEditingController validationController = TextEditingController();
  TextEditingController timePickController = TextEditingController();

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

    if (picked != null && picked !=validationController.text) {
      validationController.text = "${picked.day}/${picked.month}/${picked.year}";
      update();
    }
  }

  ///=======================TimePicker ===================///

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
        selectedTime = pickedTime;
        update();
    }
  }
}