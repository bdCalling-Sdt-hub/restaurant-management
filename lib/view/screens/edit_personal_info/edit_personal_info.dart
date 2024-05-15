import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';

import 'package:restaurant_management/view/widgets/elevated_button.dart';
import 'package:restaurant_management/view/widgets/text_field.dart';

import '../../../controller/profile_controller/edit_personal_info_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';

class EditPersonalInfo extends StatelessWidget {
    EditPersonalInfo({super.key});
EditPersonalInfoController controller =  Get.put(EditPersonalInfoController());
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
                  margin:  const EdgeInsets.only(left: 16),
                  height: 40,
                  width: 40,
                  decoration:  const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child:  const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
        centerTitle: true,
        title:  const CustomText(
          text: "Edit Personal Information",
          color:  AppColors.blackNormal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<EditPersonalInfoController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding:  const EdgeInsetsDirectional.symmetric(vertical: 24,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      controller.openGallery();
                    },
                    child: controller.imageFile == null && controller.profileModel?.data?.image==""
                        ? Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/profile_image.png"))
                      ),
                    ):controller.imageFile == null? Container(
                      decoration:  const BoxDecoration(
                        color: AppColors.greenNormal,
                        shape: BoxShape.circle,
                      ),
                      child:Container(
                        height: 100,
                        width: 100,
                        decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(controller.profileImage))
                        ),
                      ),
                    ):Container(
                      decoration:  const BoxDecoration(
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
                        // child:  Icon(Icons.person_2_outlined, size: 60, color: AppColors.olive_500),
                      ),
                    ),
                    // ...
                  ),
                ),
            ///=========================Name ======================///
                 const CustomText(text: "Name",color: Color(0xff333333),),
                 const SizedBox(height: 12,),
                 CustomTextField(
                  hintText: "Name",
                  textEditingController: controller.nameController,
                ),
                 const SizedBox(height: 16,),
                ///=========================Phone number ======================///
                 const CustomText(text: "Phone number",color: Color(0xff333333),),
                 const SizedBox(height: 12,),
                 CustomTextField(
                  hintText: "Phone number",
                  textEditingController: controller.numberController,
                   keyboardType: TextInputType.number,
                   maxLength: 11,
                ),
                //  SizedBox(height: 16,),
                // ///=========================Location ======================///
                //  CustomText(text: "Address",color: Color(0xff333333),),
                //  SizedBox(height: 12,),
                //  CustomTextField(
                //   hintText: "Dhaka",
                //   maxLines: 3,
                // ),
                 const SizedBox(height: 32,),
                CustomElevatedButton(onPressed: (){
                  controller.editPersonalInfo();

                }, titleText: "Update")
              ],
            ),
          );
        }
      ),
    );
  }
}
