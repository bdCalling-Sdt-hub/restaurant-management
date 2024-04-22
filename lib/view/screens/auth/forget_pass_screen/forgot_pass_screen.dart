import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/controller/auth/forgot_password_controller.dart';
import 'package:restaurant_management/global/share_prefes_helper.dart';
import 'package:restaurant_management/view/screens/auth/verify_code_screen/verify_code.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/elevated_button.dart';
import '../../../widgets/text_field.dart';
class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});
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
            key: controller.formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 24,horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/lock_1.png",height: 220,width: 220,),
                    const CustomText(text: "Forget your Password",color: AppColors.greenNormal,fontWeight: FontWeight.w600,fontSize: 24,),
                    const CustomText(text: 'Enter the email address associated with your account ', color: Color(0xFFB0B0B0),
                      fontSize: 13,
                      maxLines: 2,
                      fontWeight: FontWeight.w300,),
                    const SizedBox(height: 16,),
                    /// ======================Email===========================///
                     CustomTextField(
                      textEditingController:controller.emailController,
                      hintText: "Email",
                       keyboardType: TextInputType.emailAddress,
                       validator:(v){
                        if(v.isEmpty){
                          return "Field doesn't be empty";
                        }
                       } ,
                    ),
                    const SizedBox(height: 24,),
                    CustomElevatedButton(onPressed: (){
                      if(controller.formKey.currentState!.validate()){
                        controller.forgotPassRepo();
                        // Get.toNamed(AppRoute.otpVerify);
                      }

                    }, titleText: "Next",titleSize: 20,titleWeight: FontWeight.w700,),
                  ],
                ),
              ),
            ),
          );
        }
      ),
      bottomNavigationBar: Image.asset("assets/images/Image.png",),
    );
  }
}
