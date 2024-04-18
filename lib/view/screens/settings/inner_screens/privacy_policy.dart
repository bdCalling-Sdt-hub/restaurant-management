import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/utils/app_colors.dart';

import '../../../widgets/custom_text.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
        centerTitle: true,
        title: const CustomText(
          text: "Privacy Policy",
          color: AppColors.blackNormal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(vertical: 24,horizontal: 20),
        child: Column(
          children: [
            CustomText(text: """
      Lorem ipsum dolor sit amet consectetur. Imperdiet iaculis convallis bibendum massa id elementum consectetur neque mauris.
      Lorem ipsum dolor sit amet consectetur. Imperdiet iaculis convallis bibendum massa id elementum consectetur neque mauris.
      Lorem ipsum dolor sit amet consectetur. Imperdiet iaculis convallis bibendum massa id elementum consectetur neque mauris.
      Lorem ipsum dolor sit amet consectetur. Imperdiet iaculis convallis bibendum massa id elementum consectetur neque mauris.
      Lorem ipsum dolor sit amet consectetur. Imperdiet iaculis convallis bibendum massa id elementum consectetur neque mauris.""",
              maxLines: 100,
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
    );
  }
}
