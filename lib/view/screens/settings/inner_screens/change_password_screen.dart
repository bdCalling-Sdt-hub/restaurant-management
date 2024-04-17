import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/text_field.dart';

class ChangePassWordScreen extends StatefulWidget {
  const ChangePassWordScreen({super.key});

  @override
  State<ChangePassWordScreen> createState() => _ChangePassWordScreenState();
}

class _ChangePassWordScreenState extends State<ChangePassWordScreen> {
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
          text: "Change Password",
          color: AppColors.blackNormal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///=========================Current password ======================///
            CustomText(text: "Current password",color: Color(0xff333333),),
            SizedBox(height: 12,),
            CustomTextField(
              hintText: "Current password",
              isPassword: true,
            ),
            SizedBox(height: 16,),
            ///=========================New password ======================///
            CustomText(text: "New password",color: Color(0xff333333),),
            SizedBox(height: 12,),
            CustomTextField(
              hintText: "New password",
              isPassword: true,
            ),
            SizedBox(height: 16,),
            ///=========================Confirm password ======================///
            CustomText(text: "Confirm password",color: Color(0xff333333),),
            SizedBox(height: 12,),
            CustomTextField(
              hintText: "Confirm password",
              isPassword: true,
            ),
          ],
        ),
      )
    );
  }
}
