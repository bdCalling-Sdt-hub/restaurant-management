import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';

class BookNow extends StatelessWidget {
  const BookNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Row(
          children: [
            GestureDetector(
              onTap: ()=>Get.back(),
              child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: const Icon(Icons.arrow_back,color: Colors.white,)),
            ),
          ],
        ),
        actions: [
          Image.asset("assets/images/logo.png",height: 44,width: 44,)
        ],
        centerTitle: true,
        title:const FittedBox(child: CustomText(text: "Book Now",color: AppColors.blackNormal,fontSize: 24,fontWeight: FontWeight.w600,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.calendar_month_rounded,size: 18,),
                CustomText(text: "Date and time from backend",fontSize: 16,fontWeight: FontWeight.w300,left: 12,)
              ],
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                Icon(Icons.group,size: 18,),
                CustomText(text: "2 Guests",fontSize: 16,fontWeight: FontWeight.w300,left: 12,)
              ],
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                Icon(Icons.table_restaurant_outlined,size: 18,),
                CustomText(text: "Indoor",fontSize: 16,fontWeight: FontWeight.w300,left: 12,)
              ],
            ),
            SizedBox(height: 32,),
            CustomElevatedButton(onPressed: (){
              alertDialog(context);
            }, titleText: "Book Now",buttonHeight: 40,buttonWidth: Get.width/1.2,)
          ],
        ),
      ),
    );
  }
  alertDialog(context){
    showDialog(context: context, builder: (context){
      return  AlertDialog(
        backgroundColor: AppColors.whiteColor,
        /* content: Stack(
          children: [
            Positioned(child: Container(
              child: IconButton(onPressed: (){}, icon: Icon(Icons.close)),
            ),top: 0,)
          ],
        ),*/
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        title:  Stack(
          clipBehavior: Clip.none,
          children: [
            const Center(child: CustomText(text: "Table Booked Successfully",textAlign: TextAlign.center,fontWeight: FontWeight.w700,fontSize: 16,)),
            Positioned(
                top: -16,
                right: -16,
                child: GestureDetector(
                    onTap: (){
                     Get.back();
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      height: 32,
                      width: 32,
                      decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.blackNormal)
                      ),
                      child:IconButton(onPressed: (){
                        Navigator.pop(context);
                        },
                          icon:  const Icon(Icons.close,color: AppColors.blackNormal,size: 16,)
                      ),)
                ))
          ],
        ),
        actions: [
          Row(
            children: [
            //  Expanded(child: CustomElevatedButton(onPressed: (){}, titleText: "No",buttonHeight: 32,borderColor: AppColors.greenNormal,buttonColor: AppColors.whiteColor,titleColor: AppColors.greenNormal,)),
             // const SizedBox(width: 12,),
              Expanded(child: CustomElevatedButton(onPressed: (){}, titleText: "Show Menu",buttonHeight: 32,buttonWidth: Get.width/2,)),
            ],
          ),

        ],

      );
    });
  }
}
