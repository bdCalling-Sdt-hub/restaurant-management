import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/controller/delete_account.controller.dart';
import 'package:restaurant_management/view/screens/settings/inner_screens/change_password_screen.dart';
import 'package:restaurant_management/view/screens/settings/inner_screens/privacy_policy.dart';
import 'package:restaurant_management/view/screens/settings/inner_screens/about_us_screen.dart';
import 'package:restaurant_management/view/screens/settings/inner_screens/term_conditions.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';
import 'package:restaurant_management/view/widgets/text_field.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List settingName = ["Change password","Term & condition","Privacy policy","About us", "Delete account"];
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
          text: "Setting",
          color: AppColors.blackNormal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
         body: Column(
            children: List.generate(settingName.length, (index){
              return GestureDetector(
                onTap: (){
                  print(index);
                  if(index==0){
                    Get.to(const ChangePassWordScreen());
                  }

                  if(index==1){
                    Get.to(const TermConditionScreen());
                  }

                  if(index==2){
                    Get.to(const PrivacyPolicy());
                  }
                  if(index==3){
                  Get.to(const AboutUsScreen());
                  }
                  if(index==4){
                    alertDialog();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    CustomText(text: settingName[index],color: index==4?Colors.red:const Color(0xff333333),fontSize: 16,) ,
                      IconButton(onPressed: (){
                        if(index==0){
                          Get.to(const ChangePassWordScreen());
                        }
                        if(index==1){
                          Get.to(const TermConditionScreen());
                        }

                        if(index==2){
                          Get.to(const PrivacyPolicy());
                        }
                        if(index==3){
                          Get.to(const AboutUsScreen());
                        }
                      }, icon: index==4?const SizedBox():  const Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),
              );
            }),
         ),
    );
  }
  alertDialog(){
    showDialog(context: context, builder: (context){
      Get.put(DeleteAccount());
      return  GetBuilder<DeleteAccount>(
        builder: (controller) {
          return AlertDialog(
            backgroundColor: AppColors.whiteColor,
           /* content: Stack(
              children: [
                Positioned(child: Container(
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.close)),
                ),top: 0,)
              ],
            ),*/
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            title:  Column(

              children: [
                const Center(child: CustomText(text: "Do you want to delete ?",textAlign: TextAlign.center,)),
                SizedBox(
                  height: 48,
                  child: CustomTextField(

                    hintText: "Enter your password",
                    textEditingController: controller.passwordController,
                  ),
                ),
                /*Positioned(
                    top: -16,
                    right: -16,
                    child: GestureDetector(
                      onTap: (){
                      Get.back();
                      },
                      child: Container(
                        height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey
                          ),
                          child:IconButton(onPressed: (){  Get.back();}, icon:  const Icon(Icons.close,color: AppColors.whiteColor,size: 16,)
                          ),)
                    ))*/
              ],
            ),
            actions: [
              Row(
                children: [
                  Expanded(child: CustomElevatedButton(onPressed: (){
                    Get.back();
                  }, titleText: "No",buttonHeight: 32,borderColor: AppColors.greenNormal,buttonColor: AppColors.whiteColor,titleColor: AppColors.greenNormal,)),
                 const SizedBox(width: 12,),
                  Expanded(child: CustomElevatedButton(onPressed: (){
                    controller.deleteAccount();
                  }, titleText: "Yes",buttonHeight: 32,)),
                ],
              ),

            ],

          );
        }
      );
    });
  }
  
}
