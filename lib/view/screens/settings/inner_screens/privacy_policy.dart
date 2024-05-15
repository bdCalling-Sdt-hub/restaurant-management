import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/controller/setting_content_controller.dart';
import 'package:restaurant_management/utils/app_colors.dart';

import '../../../widgets/custom_text.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  void initState() {
    SettingContentController controller = Get.put(SettingContentController());
    controller.settingContent("privacyPolicy");
    // TODO: implement initState
    super.initState();
  }
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
          text: "Privacy Policy",
          color: AppColors.blackNormal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body:  GetBuilder<SettingContentController>(
        builder: (controller) {
          return controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.greenNormal,)):


          controller.model.data?.privacyPolicy ==null?
          const Center(child: CustomText(text: "No Data Found",color: AppColors.greenNormal,fontSize: 24,fontWeight: FontWeight.w600,)): SingleChildScrollView(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 24,horizontal: 20),
            child: Html(data: controller.model.data?.privacyPolicy),
          );
        }
      ),
    );
  }
}
