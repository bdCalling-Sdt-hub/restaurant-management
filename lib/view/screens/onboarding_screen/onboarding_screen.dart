
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/elevated_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {


  Map <String,dynamic> data = {

    "image" : ["assets/images/images.png","assets/images/images (1).jpg","assets/images/images (2).jpg"],
    "shortDescription" : ["Get matched today","Send video, voice & text", "Claim your happiness"],
    "description": ["Talk to a therapist in the comfort of your space" ,
      "No appointments required. Therapy that works well with your schedule and routine" ,
      "It starts with a single message.  We'll Give Everything We Can for Your Mental Health"],
  };

  final PageController controller = PageController();
  bool isLastPage=false;
  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
          child: Column(
            children: [
              ///===========================Short description======================///
              CustomText(text: data["shortDescription"][currentPosition].toString(),
                color: const Color(0xFF54A630),
                fontSize: 24,
                fontWeight: FontWeight.w600,
                bottom: 12,
              ),
              ///===========================description======================///
              CustomText(text: data["description"][currentPosition].toString(),color:AppColors.black80,
                fontWeight: FontWeight.w600,
                maxLines: 3,
                fontSize:16,),
              Flexible(
                child: PageView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: data["image"].length,
                  onPageChanged: (value) {
                    setState(() {
                      currentPosition=value;
                      if(currentPosition==2){
                        isLastPage=true;
                      }else{
                        isLastPage=false;
                      }
                    }
                    );
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ///===========================Image ============================///
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit:BoxFit.cover,
                                image: AssetImage(data["image"][index]),
                              )
                          ),
                        ),

                      ],
                    );
                  },

                ),
              ),
              ///============================= dot indicator ==========================///
              CustomElevatedButton(
                onPressed: () {
                  if (isLastPage) {
                    //Get.toNamed(AppRoute.selectRoleScreen);
                  } else {
                    // Go to the next page
                    controller.nextPage(
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeInSine,
                    );
                  }
                },
                titleText: isLastPage?"Get Started":"Get Started",),

            ],
          ),
        ),
      ),

      bottomNavigationBar:Padding(
        padding:  const EdgeInsets.symmetric(vertical: 40, horizontal: 80),
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => Container(
                  margin: const EdgeInsets.all(5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == currentPosition ? AppColors.black90 : AppColors.green
                  ),
                )),
              ),
            ),

          ],
        ),
      ),

    );
  }
}