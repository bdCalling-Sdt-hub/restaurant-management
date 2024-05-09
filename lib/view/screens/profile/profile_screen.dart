import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/controller/profile_controller/personal_info_controller.dart';
import 'package:restaurant_management/global/share_prefes_helper.dart';
import 'package:restaurant_management/utils/app_colors.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/view/screens/my_orders/my_order_screen.dart';
import 'package:restaurant_management/view/screens/settings/setting_screen.dart';
import 'package:restaurant_management/view/widgets/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../global/api_url_container.dart';
import '../../widgets/bottom_nav/bottom_nav.dart';
import '../../widgets/elevated_button.dart';
import 'inner_screen/personal_info_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Map<String ,dynamic>> data1 = [
    {
    "routeName": "Personal Information",
      "icon" : const Icon(Icons.person_outline_rounded,color: Colors.black,)
  },
    {
      "routeName": "My Order",
      "icon" : const Icon(Icons.fastfood_outlined)
    },
    {
      "routeName": "My Booking",
      "icon" : const Icon(Icons.card_travel_outlined)
    },
    {
      "routeName": "Settings",
      "icon" : const Icon(Icons.settings_outlined)
    },
    {
      "routeName": "Logout",
      "icon" : const Icon(Icons.logout,color: Colors.red,)
    }
  ];

  PersonalInfoController controller = Get.put(PersonalInfoController());
  @override
  void initState() {

    Future.delayed(Duration.zero, () {
     controller.getPersonalInfoData();
    },) ;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PersonalInfoController>(
        builder: (controller) {
          return  Column(
            children: [
              Flexible(
                flex: 4,
                child:   controller.isLoading ? const Center(child: CircularProgressIndicator(color: AppColors.greenNormal,)): Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: AppColors.greenNormal,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight:Radius.circular(16), )
                  ),
                  child:  Column(
                    children: [
                      const SizedBox(height: 50,),
                      const CustomText(text: "Profile",color: AppColors.whiteColor,fontSize: 24,fontWeight: FontWeight.w600,),
                      const SizedBox(height: 40,),
                  "${controller.model.data?.image}" == ""|| controller.image.isEmpty ? Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/profile_image.png"))
                        ),
                      ) : Container(
                        height: 100,
                        width: 100,
                        decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(controller.image)
                            )
                        ),
                      ),
                      const SizedBox(height: 30,),
                       CustomText(text: "${controller.model.data?.fullName.toString()}",color: AppColors.whiteColor,fontSize: 20,fontWeight: FontWeight.w500,),
                       CustomText(text: "${controller.model.data?.email.toString()}" ,color: AppColors.whiteColor,fontSize: 12),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              Flexible(
                flex: 4,
                child: Container(
                width: Get.width,
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor
                  ),
                  child: Column(
                    children: [
                       Column(
                         children: List.generate(data1.length, (index){
                           return GestureDetector(
                             onTap: (){
                               if(index==0){
                               Get.to(const PersonalInfoScreen());
                               }
                               if(index==1){
                                 Get.to(const MyOrderScreen(text: 'My Orders', index: 0, status1: 'Unpaid', status2: 'Half Paid', status3: 'Paid',));
                               }
                               if(index==2){
                                 Get.to(const MyOrderScreen(text: 'My Booking', index: 1, status1: 'Booked', status2: 'Cancelled', status3: 'Closed',));
                               }
                               if(index==3){
                                 Get.to(const SettingScreen());
                               }
                               if(index==4){
                                 alertDialog();
                               }
                             },
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 12),
                               child: Column(
                                 children: [
                                   Row(
                                     children: [
                                       data1[index]["icon"],
                                      // Icon(Icons.person_outline_rounded,color: Colors.black,),
                                       CustomText(text: data1[index]["routeName"].toString(),color: data1[index]["routeName"]=="Logout"? Colors.red : const Color(0xff333333),left: 20,)
                                     ],
                                   ),
                                   const Divider(color: AppColors.greenLightActive,)
                                 ],
                               ),
                             ),

                           );
                         }),
                       ),

                    ],
                  ),
                ),
              ),


            ],
          );
        }
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
    );
  }

  ///=================Alert Dialog==================//
  alertDialog(){
    showDialog(context: context, builder: (context){
      return  AlertDialog(
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
        title:  const Center(child: CustomText(text: "Do you want to logout ?",textAlign: TextAlign.center,)),
        actions: [
          Row(
            children: [
              Expanded(child: CustomElevatedButton(onPressed: (){Get.back();}, titleText: "No",buttonHeight: 32,borderColor: AppColors.greenNormal,buttonColor: AppColors.whiteColor,titleColor: AppColors.greenNormal,)),
              const SizedBox(width: 12,),
              Expanded(child: CustomElevatedButton(onPressed: ()async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.clear();
                pref.setString("accessToken", "");
                pref.setString("email", "");
                PrefsHelper.accessToken = "";
                PrefsHelper.email = "";
                Get.offAndToNamed(AppRoute.signin);


              }, titleText: "Yes",buttonHeight: 32,)),
            ],
          ),

        ],

      );
    }
    );
  }
}
