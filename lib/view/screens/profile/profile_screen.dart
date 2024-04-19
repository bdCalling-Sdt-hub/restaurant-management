import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/utils/app_colors.dart';
import 'package:restaurant_management/view/screens/my_orders/my_order_screen.dart';
import 'package:restaurant_management/view/screens/settings/setting_screen.dart';
import 'package:restaurant_management/view/widgets/custom_text.dart';

import '../../widgets/bottom_nav/bottom_nav.dart';
import '../../widgets/elevated_button.dart';
import 'inner_screen/personal_info_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Map<String ,dynamic>> data = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
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
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage("https://plus.unsplash.com/premium_photo-1713184149461-67ad584d82e6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0Mnx8fGVufDB8fHx8fA%3D%3D"))
                    ),
                  ),
                  const SizedBox(height: 30,),
                  const CustomText(text: "Kabir",color: AppColors.whiteColor,fontSize: 20,fontWeight: FontWeight.w500,),
                  const CustomText(text: "kabir@gmail.com",color: AppColors.whiteColor,fontSize: 12),

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
                     children: List.generate(data.length, (index){
                       return GestureDetector(
                         onTap: (){
                           if(index==0){
                           Get.to(const PersonalInfoScreen());
                           }
                           if(index==1){
                             Get.to(const MyOrderScreen(text: 'My Orders', index: 0,));
                           }
                           if(index==2){
                             Get.to(const MyOrderScreen(text: 'My Booking', index: 1,));
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
                                   data[index]["icon"],
                                  // Icon(Icons.person_outline_rounded,color: Colors.black,),
                                   CustomText(text: data[index]["routeName"].toString(),color: data[index]["routeName"]=="Logout"? Colors.red : const Color(0xff333333),left: 20,)
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
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
    );
  }

  ///=================Alert Dialoge==================//
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
              Expanded(child: CustomElevatedButton(onPressed: (){}, titleText: "No",buttonHeight: 32,borderColor: AppColors.greenNormal,buttonColor: AppColors.whiteColor,titleColor: AppColors.greenNormal,)),
              const SizedBox(width: 12,),
              Expanded(child: CustomElevatedButton(onPressed: (){}, titleText: "Yes",buttonHeight: 32,)),
            ],
          ),

        ],

      );
    }
    );
  }
}
