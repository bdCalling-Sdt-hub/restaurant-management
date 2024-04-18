import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/view/screens/edit_personal_info/edit_personal_info.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  List<Map<String, dynamic>> data = [
    {
      "routeName": "Personal Information",
      "icon": const Icon(
        Icons.person_outline_rounded,
        color: Colors.black,
      )
    },
    {"routeName": "My Order", "icon": const Icon(Icons.fastfood_outlined)},
    {"routeName": "My Booking", "icon": const Icon(Icons.card_travel_outlined)},
    {"routeName": "Settings", "icon": const Icon(Icons.settings_outlined)},
    {
      "routeName": "Logout",
      "icon": const Icon(
        Icons.logout,
        color: Colors.red,
      )
    },
    {
      "routeName": "Logout",
      "icon": const Icon(
        Icons.logout,
        color: Colors.red,
      )
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: Get.width,
              decoration: const BoxDecoration(
                  color: AppColors.greenNormal,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  )),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: AppColors.whiteColor,
                          )),
                      const CustomText(
                        text: "Personal Information",
                        color: AppColors.whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://plus.unsplash.com/premium_photo-1713184149461-67ad584d82e6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0Mnx8fGVufDB8fHx8fA%3D%3D"))),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const CustomText(
                    text: "Kabir",
                    color: AppColors.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(const EditPersonalInfo());
                    },
                    child: Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.whiteColor),
                      child: const CustomText(
                        text: "Edit Profile",
                        color: AppColors.greenNormal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: Get.width,
              decoration: const BoxDecoration(color: AppColors.whiteColor),
              child: const Column(
                children: [
                  ///=====================Name ========================>
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_outline_rounded,
                              color: Colors.black,
                            ),
                            CustomText(
                              text: "Name",
                              color: Color(0xff333333),
                              left: 20,
                            )
                          ],
                        ),
                        Divider(
                          color: AppColors.greenLightActive,
                        )
                      ],
                    ),
                  ),

                  ///=====================DOB ========================>
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.cake_outlined,
                              color: Colors.black,
                            ),
                            CustomText(
                              text: "12-03-1999",
                              color: Color(0xff333333),
                              left: 20,
                            )
                          ],
                        ),
                        Divider(
                          color: AppColors.greenLightActive,
                        )
                      ],
                    ),
                  ),

                  ///=====================Gender ========================>
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.male_outlined,
                              color: Colors.black,
                            ),
                            CustomText(
                              text: "Male",
                              color: Color(0xff333333),
                              left: 20,
                            )
                          ],
                        ),
                        Divider(
                          color: AppColors.greenLightActive,
                        )
                      ],
                    ),
                  ),

                  ///=====================phone number ========================>
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.black,
                            ),
                            CustomText(
                              text: "012345234",
                              color: Color(0xff333333),
                              left: 20,
                            )
                          ],
                        ),
                        Divider(
                          color: AppColors.greenLightActive,
                        )
                      ],
                    ),
                  ),

                  ///=====================email ========================>
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                            ),
                            CustomText(
                              text: "kabir@gmail.com",
                              color: Color(0xff333333),
                              left: 20,
                            )
                          ],
                        ),
                        Divider(
                          color: AppColors.greenLightActive,
                        )
                      ],
                    ),
                  ),

                  ///=====================location ========================>
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.black,
                            ),
                            CustomText(
                              text: "Dhaka",
                              color: Color(0xff333333),
                              left: 20,
                            )
                          ],
                        ),
                        Divider(
                          color: AppColors.greenLightActive,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
