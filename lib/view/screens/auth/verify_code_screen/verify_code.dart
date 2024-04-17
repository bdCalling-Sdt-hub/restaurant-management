import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:restaurant_management/view/screens/auth/reset_password_scree/reset_password_screen.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/elevated_button.dart';
class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});
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
        child:  Center(
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
             //   controller: controller.otpController,
                keyboardType: TextInputType.number,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                textStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackNormal),
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    disabledColor: Colors.blue,
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
              const SizedBox(height: 24,),
              CustomElevatedButton(onPressed: (){
              Get.to(const ResetPassword());

              }, titleText: "Next",titleSize: 20,titleWeight: FontWeight.w700,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Image.asset("assets/images/Image.png",),
    );
  }
}
