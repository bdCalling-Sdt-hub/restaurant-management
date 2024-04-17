import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_management/utils/app_colors.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

         body: Center(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 20),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text.rich(
                   TextSpan(
                     children: [
                       TextSpan(
                         text: 'Welcome to ',
                         style: GoogleFonts.roboto(
                           color: Colors.black,
                           fontSize: 24,
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                       TextSpan(
                         text: 'App Name',
                         style: GoogleFonts.roboto(
                           color: Color(0xFF4C9A29),
                           fontSize: 24,
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                     ],
                   ),
                 ),
                 Text(
                   'There’s so much to explore',
                   style: GoogleFonts.roboto(
                     color: const Color(0xFFC9E1BC),
                     fontSize: 14,
                     fontWeight: FontWeight.w400,
                   ),
                 ),
                 Image.asset("assets/images/Logo1.png"),
                 CustomElevatedButton(onPressed: (){
                 Get.toNamed(AppRoute.signup);
                 }, titleText: "Create an account"),
                 const SizedBox(height: 12,),
                 CustomElevatedButton(onPressed: (){
                   Get.toNamed(AppRoute.signin);
                 }, titleText: "Login"),
               ],

             ),
           ),
         ),
      bottomNavigationBar: Image.asset("assets/images/Image.png",),
    );
  }
}
