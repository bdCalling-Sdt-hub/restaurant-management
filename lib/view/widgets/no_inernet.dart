import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import 'custom_text.dart';
import 'elevated_button.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("No Internet".tr,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
                child: Icon(
                  Icons.wifi_off,
                  size: 100,
                )),
            CustomText(
              text: "No Internet".tr,
              fontSize: 18,
              top: 16,
            ),
            CustomText(
              text: "check Internet".tr,
              top: 8,
              bottom: 20,
            ),
            CustomElevatedButton(
              onPressed: () => Get.back(),
              titleText: "back".tr,
              titleColor: AppColors.whiteColor,
              buttonWidth: 80,
              buttonHeight: 40,
            )
          ],
        ),
      ),
    );
  }
}
