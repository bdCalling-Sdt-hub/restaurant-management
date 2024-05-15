import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_management/controller/auth/signin_controller.dart';
import 'package:restaurant_management/view/screens/auth/forget_pass_screen/forgot_pass_screen.dart';
import 'package:restaurant_management/view/widgets/custom_loading.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/elevated_button.dart';
import '../../../widgets/text_field.dart';
class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Get.put(SignInController());
    return GetBuilder<SignInController>(
      builder: (controller) {
        return Scaffold(
          body: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
              child:  Column(
                children: [
                  Image.asset("assets/images/lock.png"),
                  const CustomText(text: "Login to your Account ",color: AppColors.greenNormal,fontWeight: FontWeight.w600,fontSize: 24,),
                  const SizedBox(height: 16,),
                  /// ======================Email===========================///
                   CustomTextField(
                    hintText: "Email",
                    textEditingController: controller.emailController,
                     keyboardType: TextInputType.emailAddress,
                       validator: (value) {
                         if (value!.isEmpty) {
                           return "This field is required";
                         } else if (!controller.emailRegexp
                             .hasMatch(controller.emailController.text)) {
                           return 'Enter valid email';
                         }else {
                           return null;
                         }
                       }
                  ),
                  const SizedBox(height: 16,),
                  /// ======================password===========================///
                   CustomTextField(
                    hintText: "Password",
                     textEditingController: controller.passwordController,
                     isPassword: true,
                     validator: (v){
                      if(v.isEmpty){
                        return "Please your password";
                      }
                     },

                  ),
                  const SizedBox(height: 6,),

                  Align(alignment:Alignment.centerRight,child:  TextButton(onPressed: (){

                    Get.to(const ForgotPassScreen());
                  }, child: const CustomText(text: "Forgot Password?",fontWeight: FontWeight.w700,color: AppColors.greenNormal,))),
                  const SizedBox(height: 6,),
                controller.isLoading?CustomElevatedLoadingButton():  CustomElevatedButton(onPressed: (){
                    if(controller.formKey.currentState!.validate()){
                      controller.signInRepo();
                    }

                  }, titleText: "Login",titleSize: 20,titleWeight: FontWeight.w700,),
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
          ),
          bottomNavigationBar: Image.asset("assets/images/Image.png",),
        );
      }
    );
  }
}
