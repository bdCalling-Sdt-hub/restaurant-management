import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trip/utils/app_colors.dart';
import 'package:go_trip/view/screens/onboarding_screen/onboarding_screen.dart';
import 'package:go_trip/view/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

 Future.delayed(const Duration(seconds: 3),(){
Get.to(const Onboarding());
 });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/log.jpg",height: 120,width: 120,),
            const CustomText(text: "Go Trip",color: AppColors.whiteColor,fontSize: 18,top: 16,)

          ],
        ),
      ),
    );
  }
}
