import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';

class RestaurantOwnerScreen extends StatelessWidget {
  const RestaurantOwnerScreen({super.key});

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
          text: "Restaurant Owner",
          color: AppColors.blackNormal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("https://plus.unsplash.com/premium_photo-1713184149461-67ad584d82e6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0Mnx8fGVufDB8fHx8fA%3D%3D"))
              ),
            ),
              const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Owner Name",fontSize: 16,fontWeight: FontWeight.w500,top: 12,),
                Row(
                  children: [
                    Icon(Icons.wifi_calling_3_rounded,color: Colors.black,size: 16,),
                    SizedBox(width: 16,),
                    Icon(Icons.message,color: Colors.black,size: 16,)
                  ],
                )
              ],
            ),

            const CustomText(text: "Owner at Deze Restaurants",fontSize: 16,fontWeight: FontWeight.w400,),
            const CustomText(text: "2250 International Street Columbus, OH 43228, USA",fontSize: 10,fontWeight: FontWeight.w400,bottom: 12,),
            const CustomText(
              maxLines: 20,

              text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",fontSize: 14,fontWeight: FontWeight.w300,),
          ],
        ),
      ),
    );
  }
}
