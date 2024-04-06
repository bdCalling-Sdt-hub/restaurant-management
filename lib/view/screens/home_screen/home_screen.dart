import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_management/utils/app_colors.dart';
import 'package:restaurant_management/view/widgets/custom_text.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';
import 'package:restaurant_management/view/widgets/text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < 10 - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/logo.png",height: 32,width: 32,),
        centerTitle: true,
        title:   const CustomText(text: "Book a table",color: AppColors.blackNormal,fontSize: 24,fontWeight: FontWeight.w600,),
      ),
      body: Column(
        children: [
          const CustomTextField(
            fieldBorderColor: Colors.transparent,
            focusBorderColor: Colors.transparent,
            fillColor: Color(0xffE6E7E9),
            hintText: "Search",
            isPrefixIcon: true,
            icon: Icon(Icons.search,color: AppColors.blackLightActive,),
          ),
             SizedBox(
               height: 200,
               child: Column(
                 children: [
                   Container(
                     margin: const EdgeInsets.only(top: 12),
                     height: 150, // Adjust the height as needed
                     child: PageView.builder(
                       controller: _pageController,
                       scrollDirection: Axis.horizontal,
                       itemCount:10,
                       onPageChanged: (int page) {
                         setState(() {
                           _currentPage = page;
                         });
                       },
                       itemBuilder: (context, index) {
                         return Container(
                           margin: const EdgeInsets.only(right: 8), // Adjust spacing between items
                           padding: const EdgeInsets.all(8),
                           decoration: BoxDecoration(
                             color: AppColors.greenNormal,
                             borderRadius: BorderRadius.circular(8),
                           ),
                           child: Row(
                             children: [
                               const Flexible(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     CustomText(
                                       text: "Too Hôtel",
                                       color: AppColors.whiteColor,
                                       fontWeight: FontWeight.w700,
                                       fontSize: 20,
                                       textAlign: TextAlign.start,
                                     ),
                                     CustomText(
                                       text: "We are here with the best\ndeserts intown.",
                                       maxLines: 2,
                                       color: AppColors.whiteColor,
                                       fontWeight: FontWeight.w100,
                                       top: 12,
                                       bottom: 12,
                                     ),
                                     Row(
                                       children: [
                                         CustomText(
                                           text: "Too Hôtel",
                                           color: AppColors.whiteColor,
                                           fontWeight: FontWeight.w700,
                                           fontSize: 20,
                                         ),
                                         Icon(Icons.arrow_forward_ios_outlined, color: AppColors.whiteColor)
                                       ],
                                     )
                                   ],
                                 ),
                               ),
                               const SizedBox(width: 8), // Add spacing between widgets
                               Container(
                                 height: 120,
                                 width: 180,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(8),
                                   image: const DecorationImage(
                                     fit: BoxFit.fill,
                                     image: NetworkImage("https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         );
                       },
                     ),
                   ),
                 ],
               ),
             ),

             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Column(
                   crossAxisAlignment:CrossAxisAlignment.start ,
                   children: [
                     CustomText(
                       text: "Today New Arivable",
                       color: AppColors.blackNormal,
                       fontSize: 16,
                       fontWeight: FontWeight.w700,
                     ),
                     CustomText(
                       text: "Best of the today  food list update",
                       color: AppColors.blackNormal,
                       fontWeight: FontWeight.w300,
                     ),
                   ],
                 ),
                 GestureDetector(
                     onTap: () {
                       // Get.to(NearByScreen(categoty: "Nearby".tr),
                       //     arguments:
                       //     controller.nearestShopModel.data);
                     },
                     child: const Row(
                       children: [
                         CustomText(
                           text: "See all",
                           color: AppColors.blackNormal,
                           fontSize: 12,
                           fontWeight: FontWeight.w300,
                         ),
                         Icon(Icons.arrow_forward_ios_outlined,size: 16,)
                       ],
                     )
                 ),
               ],
             ),
             const SizedBox(
               height: 12,
             ),

             Expanded(
               child: ListView.builder(
                   itemCount: 10,
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context, index) {
                     return GestureDetector(
                       onTap: () {
                         // Get.to(const StoreDetailsScreen(),
                         //     arguments: controller
                         //         .nearestShopModel.data?[index].sId);
                       },
                       child: Container(
                         margin: const EdgeInsets.only(right: 12),
                         padding: const EdgeInsets.all(12),
                         decoration: BoxDecoration(

                           color: AppColors.greenLight,
                           borderRadius: BorderRadius.circular(12),
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               height: 200,
                               width: 260,
                               padding: const EdgeInsets.all(8),
                               decoration: BoxDecoration(
                                   borderRadius:
                                   BorderRadius.circular(12),
                                   image: const DecorationImage(
                                     fit: BoxFit.cover,
                                     image: NetworkImage("https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                                   )
                               ),

                             ),
                             const SizedBox(
                               height: 12,
                             ),

                             const CustomText(
                               text:"Swedish Restaurants",
                               color: AppColors.blackNormal,
                               fontSize: 14,
                               fontWeight: FontWeight.w700,
                             ),
                             const Row(
                               children: [
                                 Icon(Icons.location_on_outlined,color: AppColors.blackLightActive,),
                                 CustomText(text: "Ambrosia Hotel & Restaurant",fontSize: 10,fontWeight: FontWeight.w300,color: AppColors.blackNormal,bottom: 12,top: 12,)
                               ],
                             ),

                             CustomElevatedButton(onPressed: (){}, titleText: "Book a Table",buttonHeight: 48,)

                           ],
                         ),
                       ),
                     );
                   }),
             ),


      ],
      ),
    );
  }
}
