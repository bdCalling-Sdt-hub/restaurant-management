import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/controller/edit_personal_info_controller.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';
import 'package:restaurant_management/view/widgets/text_field.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';

class EditPersonalInfo extends StatelessWidget {
  const EditPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditPersonalInfoController());
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
          text: "Edit Personal Information",
          color:  AppColors.blackNormal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<EditPersonalInfoController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 24,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      controller.openGallery();
                    },
                    child: controller.imageFile == null
                        ? Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            shape: BoxShape.circle,
                            image: const DecorationImage(fit: BoxFit.fill,image: NetworkImage("https://plus.unsplash.com/premium_photo-1713184149461-67ad584d82e6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0Mnx8fGVufDB8fHx8fA%3D%3D"))
                        ),
                        child: const Icon(Icons.camera_alt_outlined,color: AppColors.whiteColor,),
                      ),
                    )
                        : Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(controller.imageFile!),
                            // Use FileImage for File
                            fit: BoxFit.cover, // You can adjust this based on your needs
                          ),
                        ),
                        // child: const Icon(Icons.person_2_outlined, size: 60, color: AppColors.olive_500),
                      ),
                    ),
                    // ...
                  ),
                ),
            ///=========================Name ======================///
                const CustomText(text: "Name",color: Color(0xff333333),),
                const SizedBox(height: 12,),
                const CustomTextField(
                  hintText: "Name",
                ),
                const SizedBox(height: 16,),
                ///=========================Phone number ======================///
                const CustomText(text: "Phone number",color: Color(0xff333333),),
                const SizedBox(height: 12,),
                const CustomTextField(
                  hintText: "Phone number",
                ),
                const SizedBox(height: 16,),
                ///=========================Location ======================///
                const CustomText(text: "Address",color: Color(0xff333333),),
                const SizedBox(height: 12,),
                const CustomTextField(
                  hintText: "Dhaka",
                  maxLines: 3,
                ),
                const SizedBox(height: 32,),
                CustomElevatedButton(onPressed: (){}, titleText: "Update")
              ],
            ),
          );
        }
      ),
    );
  }
}
