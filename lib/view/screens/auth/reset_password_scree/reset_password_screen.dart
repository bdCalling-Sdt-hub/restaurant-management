import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_management/controller/auth/forgot_password_controller.dart';
import 'package:restaurant_management/view/screens/auth/forget_pass_screen/forgot_pass_screen.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/elevated_button.dart';
import '../../../widgets/text_field.dart';
class ResetPassword extends StatelessWidget {
   ResetPassword({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordController());
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
      body: GetBuilder<ForgotPasswordController>(
        builder: (controller) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
              child:  Column(
                children: [
                  Image.asset("assets/images/reset+pass.png",height: 200,width: 200,),
                  const CustomText(text: "Reset Password",color: AppColors.greenNormal,fontWeight: FontWeight.w600,fontSize: 24,),
                  const SizedBox(height: 16,),
                  /// ======================password===========================///
                   CustomTextField(
                    hintText: "Password",
                    textEditingController: controller.newPassController,
                    isPassword: true,
                     validator: (v){
                      if(v.toString().length<6){
                        return "Password must be 6 character";
                      }
                      if(v.isEmpty){
                        return "Field doesn't be empty";
                      }
                      return null;
                     },
                  ),
                  const SizedBox(height: 16,),
                  /// ======================confirm password===========================///
                   CustomTextField(
                    hintText: "Confirm password",
                    isPassword: true,
                    textEditingController: controller.confirmPassController,
                    validator: (v){
                      if(v.toString().length < 6){
                        return "Password must be 6 character";
                      }
                      if(v.toString().isEmpty){
                        return "Field doesn't be empty";
                      }
                      if(controller.newPassController.text!=controller.confirmPassController.text){
                        return "password doesn't match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24,),
                  CustomElevatedButton(onPressed: (){

                    if(formKey.currentState!.validate()){
                      controller.resetPassword();
                    }
                  //  Get.offAllNamed(AppRoute.signin);

                  }, titleText: "Reset",titleSize: 20,titleWeight: FontWeight.w700,),

                ],
              ),
            ),
          );
        }
      ),
      bottomNavigationBar: Image.asset("assets/images/Image.png",),
    );
  }
}
