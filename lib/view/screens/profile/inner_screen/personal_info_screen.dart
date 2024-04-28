import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/controller/profile_controller/personal_info_controller.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/view/screens/edit_personal_info/edit_personal_info.dart';

import '../../../../controller/profile_controller/edit_personal_info_controller.dart';
import '../../../../global/api_url_container.dart';
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
    Get.put(PersonalInfoController());
    return Scaffold(
      body: GetBuilder<PersonalInfoController>(
        builder: (controller) {
          return Column(
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
                  controller.model.data?.image==null || controller.image.isEmpty ? Container(
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
                            image: NetworkImage("${controller.image}")
                          //  image: NetworkImage("${ApiUrl.baseUrl}${controller.model.data?.image}")

                        )
                    ),
                  ),
                      const SizedBox(
                        height: 24,
                      ),
                       CustomText(
                        text: controller.model.data?.fullName??"",
                        color: AppColors.whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      GestureDetector(
                        onTap: (){

                          EditPersonalInfoController editPersonalInfoController = Get.put(EditPersonalInfoController());

                          editPersonalInfoController.nameController.text = controller.model.data?.fullName.toString() ?? "";
                          editPersonalInfoController.numberController.text = controller.model.data?.phoneNumber.toString() ?? "";

                          editPersonalInfoController.profileImage = controller.image;


                          Get.toNamed(AppRoute.editProfile);
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
                  child:  Column(
                    children: [
                      ///=====================Name ========================>
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.black,
                                ),
                                CustomText(
                                  text: controller.model.data?.fullName??"",
                                  color: Color(0xff333333),
                                  left: 20,
                                )
                              ],
                            ),
                            const Divider(
                              color: AppColors.greenLightActive,
                            )
                          ],
                        ),
                      ),

                  /*    ///=====================DOB ========================>
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
                                  text: controller.model.data??"",
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
                      ),*/

                    /*  ///=====================Gender ========================>
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
                      ),*/

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
                                  text: controller.model.data?.phoneNumber??"",
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
                                  text: controller.model.data?.email??"",
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
/*
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
                      )*/
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
