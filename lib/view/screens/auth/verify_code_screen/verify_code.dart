import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:restaurant_management/controller/auth/signup_controller.dart';
import 'package:restaurant_management/view/screens/auth/reset_password_scree/reset_password_screen.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/elevated_button.dart';
class VerifyCodeScreen extends StatelessWidget {
   VerifyCodeScreen({super.key});
  final formKey =  GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
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
      body: GetBuilder<SignupController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
            child:  Form(
              key: formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/verify_code.png",height: 220,width: 220,),
                    const CustomText(text: "Check Email for 4-Digits PIN",color: AppColors.greenNormal,fontWeight: FontWeight.w600,fontSize: 24,),
                    const SizedBox(height: 16,),
                    /// ======================OTP===========================///
                    PinCodeTextField(
                      length: 4,
                      obscureText: false,
                       controller: controller.otpController,
                      keyboardType: TextInputType.number,
                      cursorColor: AppColors.blackNormalhover,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      validator: (va){
                        if(va!.isEmpty||va==null){
                          return 'input otp';
                        }
                      },
                      textStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackNormal),
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                        //  disabledColor: Colors.blue,
                          fieldHeight: 56,
                          fieldWidth: 44,
                          activeColor: AppColors.greenNormal,
                          inactiveColor: AppColors.greenNormal,
                          activeFillColor: AppColors.whiteColor,
                          inactiveFillColor: AppColors.whiteColor,
                          selectedFillColor: AppColors.whiteColor,
                          selectedColor: AppColors.greenNormal),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: false,
                      onCompleted: (v) {},
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        return true;
                      },
                      appContext: context,
                    ),
                    TextButton(
                      onPressed: (){
                        controller.resendOtp();
                      },
                      child: const CustomText(text: "Resend Code?",  color: Color(0xFFB0B0B0),
                        ),
                    ),
                    const SizedBox(height: 12,),
                    CustomElevatedButton(onPressed: (){
                      if(formKey.currentState!.validate()){

                        controller.verifyOtp();

                      }

                  //  Get.to(const ResetPassword());

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
