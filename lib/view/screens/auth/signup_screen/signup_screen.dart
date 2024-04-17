
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';
import 'package:restaurant_management/view/widgets/text_field.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
            const CustomText(text: "Create an Account",color: AppColors.greenNormal,fontWeight: FontWeight.w600,fontSize: 24,),
            /// ======================Name===========================///
            const CustomTextField(
             hintText: "User name",

            ),
            const SizedBox(height: 16,),
            /// ======================Email===========================///
            const CustomTextField(
              hintText: "Email",
            ),
            const SizedBox(height: 16,),
            /// ======================Phone Number===========================///
            const CustomTextField(
              hintText: "Phone number",
            ),
            const SizedBox(height: 16,),
            /// ======================password===========================///
            const CustomTextField(
              hintText: "Password",
              isPassword: true,
            ),
            const SizedBox(height: 16,),
            /// ======================Comfirm pass===========================///
            const CustomTextField(
              hintText: "Confirm password",
              isPassword: true,
            ),
         const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/right_icon.png",height: 20,width: 20,),
                const Flexible(child: CustomText(left: 12,text: "By continuing, I agree to terms of services and acknowledge PullUp’s privacy policy including PullUp’s cookies policy.",maxLines: 4,fontWeight: FontWeight.w300,))
              ],
            ),
            const SizedBox(height: 12,),
            CustomElevatedButton(onPressed: (){}, titleText: "Create",titleSize: 20,titleWeight: FontWeight.w700,),
            const SizedBox(height: 12,),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an Account? ',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'Login',
                    recognizer: TapGestureRecognizer()..onTap = (){
                      Get.toNamed(AppRoute.signin);
                    },
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF4C9A29),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Image.asset("assets/images/Image.png",),
    );
  }
}
