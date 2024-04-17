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
class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});
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
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
        child:  Column(
          children: [
            Image.asset("assets/images/lock.png"),
            const CustomText(text: "Login to your Account ",color: AppColors.greenNormal,fontWeight: FontWeight.w600,fontSize: 24,),
            const SizedBox(height: 16,),
            /// ======================Email===========================///
            const CustomTextField(
              hintText: "Email",
            ),
            const SizedBox(height: 16,),
            /// ======================password===========================///
            const CustomTextField(
              hintText: "Password",
            ),
            const SizedBox(height: 6,),

            Align(alignment:Alignment.centerRight,child:  TextButton(onPressed: (){

              Get.to(ForgotPassScreen());
            }, child: const CustomText(text: "Forgot Password?",fontWeight: FontWeight.w700,color: AppColors.greenNormal,))),
            const SizedBox(height: 6,),
            CustomElevatedButton(onPressed: (){}, titleText: "Login",titleSize: 20,titleWeight: FontWeight.w700,),
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
                    text: 'Register Now',
                    recognizer: TapGestureRecognizer()..onTap = (){
                      Get.toNamed(AppRoute.signup);
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
