import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/share_prefes_helper.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/app_colors.dart';
import '../onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      getBool();
    });

    super.initState();
  }

  getBool() async {
    await PrefsHelper.getAllPrefData();
    if (PrefsHelper.isLogIn) {
      Get.toNamed(AppRoute.homeScreen);
    } else {
      Get.to(const Onboarding());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 250,
              width: 300,
            ),
            //const CustomText(text: "Go Trip",color: AppColors.whiteColor,fontSize: 18,top: 16,)
          ],
        ),
      ),
    );
  }
}
