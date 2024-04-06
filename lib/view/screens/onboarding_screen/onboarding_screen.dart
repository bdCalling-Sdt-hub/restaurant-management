import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/elevated_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {


  Map <String,dynamic> data = {

    "image" : ["assets/images/onbording_1.png","assets/images/onbording_2.png"],
    "shortDescription" : ["Food variety ","Many Restaurant Listed",],
    "description": ["Lorem ipsum is a placeholder text commonly used to demonstrate the visual." ,
      "Lorem ipsum is a placeholder text commonly used to demonstrate the visual. from the client text " ,
     ],
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
              Flexible(
                child: PageView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: data["image"].length,
                  onPageChanged: (value) {
                    setState(() {
                      currentPosition=value;
                      if(currentPosition==1){
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
                          height: 380,
                          width: 360,
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

              ///===========================Short description======================///
              CustomText(text: data["shortDescription"][currentPosition].toString(),
                color: AppColors.blackNormal,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                bottom: 12,
              ),
              ///===========================description======================///
              CustomText(text: data["description"][currentPosition].toString(),
                color:AppColors.blackNormalhover,
                fontWeight: FontWeight.w600,
                maxLines: 3,
                bottom: 12,
                textAlign: TextAlign.center,
                fontSize:16,),

              CustomElevatedButton(
                buttonHeight: 48,
                buttonWidth: MediaQuery.of(context).size.width/2,
                onPressed: () {
                  if (isLastPage) {
                    Get.offAndToNamed(AppRoute.homeScreen);
                  } else {

                    controller.nextPage(
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeInSine,
                    );
                  }
                },
                titleText: "Next",),
              
              TextButton(onPressed: (){
                Get.offAndToNamed(AppRoute.homeScreen);
              }, child: const CustomText(text: "Skip",color: AppColors.greenNormal,))

            ],
          ),
        ),
      ),


    );
  }
}