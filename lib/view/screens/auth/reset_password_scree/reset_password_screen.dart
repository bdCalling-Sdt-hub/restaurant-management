import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_management/view/screens/auth/forget_pass_screen/forgot_pass_screen.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/elevated_button.dart';
import '../../../widgets/text_field.dart';
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
        child:  Column(
          children: [
            Image.asset("assets/images/reset+pass.png",height: 200,width: 200,),
            const CustomText(text: "Reset Password",color: AppColors.greenNormal,fontWeight: FontWeight.w600,fontSize: 24,),
            const SizedBox(height: 16,),
            /// ======================password===========================///
            const CustomTextField(
              hintText: "Password",
              isPassword: true,
            ),
            const SizedBox(height: 16,),
            /// ======================confirm password===========================///
            const CustomTextField(
              hintText: "Confirm password",
              isPassword: true,
            ),
            const SizedBox(height: 24,),
            CustomElevatedButton(onPressed: (){
              Get.offAllNamed(AppRoute.signin);

            }, titleText: "Reset",titleSize: 20,titleWeight: FontWeight.w700,),

          ],
        ),
      ),
      bottomNavigationBar: Image.asset("assets/images/Image.png",),
    );
  }
}
