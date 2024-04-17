import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
          text: "Favourite",
          color: AppColors.blackNormal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 20),
        child: Column(children: [
         const Divider(),
         Expanded(
           child: ListView.builder(itemBuilder: (context,index){
             return Column(
               children: [
                 Padding(
                   padding: EdgeInsetsDirectional.symmetric(vertical: 8,),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),
                           image: const DecorationImage(
                             fit: BoxFit.fill,
                             image: NetworkImage("https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YnVyZ2VyfGVufDB8fDB8fHww"),
                           ),
                         ),
                       ),
                       const CustomText(text: "Biriyani with ALu",fontWeight:  FontWeight.w700,fontSize: 16,),
                       const Row(
                         children: [
                           CustomText(text: "\$23",fontWeight:  FontWeight.w500,fontSize: 14,),
                           Icon(Icons.arrow_forward_ios,size: 16,)
                         ],
                       ),
                     ],
                   ),
                 ),
                 const Divider()
               ],
             );
           },itemCount: 12,),
         )
        ],),
      ),
    );
  }
}
