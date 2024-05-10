import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/controller/home_controller.dart';
import 'package:restaurant_management/controller/table_book_controller.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/utils/app_colors.dart';
import 'package:restaurant_management/view/screens/book_table_all/book_table_all_screen.dart';
import 'package:restaurant_management/view/screens/table_booking_screen/table_booking_screen.dart';
import 'package:restaurant_management/view/widgets/bottom_nav/bottom_nav.dart';
import 'package:restaurant_management/view/widgets/custom_text.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';


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
      body:GetBuilder<HomeController>(
        builder: (controller) {
          return controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.greenNormal,)):
          Column(
            children: [
              Column(
                children: [
                  /// =================== top banner ======================
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
                                margin: const EdgeInsets.only(right: 12,left: 12), // Adjust spacing between items
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
                                          image: AssetImage("assets/images/food_image.jpg"),
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
                ],
              ),
              /// =================== Today New arrival ======================

               Expanded(
                 child: SingleChildScrollView(
                   padding: const EdgeInsetsDirectional.symmetric(horizontal: 24,vertical: 20),
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                            const Column(
                             crossAxisAlignment:CrossAxisAlignment.start ,
                             children: [
                               CustomText(
                                 text: "Today new arrival",
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
                           controller.homeDataList.isEmpty? const CustomText(text: "",color: AppColors.greenNormal,fontSize: 24,fontWeight: FontWeight.w600,): GestureDetector(
                               onTap: () {
                                 Get.to(
                                   const BookTableAll(
                                     title: 'Book e table',
                                   ),
                                   arguments: {
                                     'dataLength': controller.homeDataList.length>5?5:controller.homeDataList.length,
                                     'homeModel': controller.homeModel,

                                     // Include other parameters here
                                   },
                                 );
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
                       const SizedBox(height: 16,),
                      controller.homeDataList.isEmpty? const CustomText(text: "No Data Found",color: AppColors.greenNormal,fontSize: 24,fontWeight: FontWeight.w600,): SizedBox(
                         height: 350,
                         child: ListView.builder(
                             itemCount: controller.homeDataList.length>5?5:controller.homeDataList.length,
                             scrollDirection: Axis.horizontal,
                             itemBuilder: (context, index) {
                               return Container(
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
                                         borderRadius: BorderRadius.circular(12),
                                         image: controller.homeDataList[index].images!=null && controller.homeDataList[index].images!.isNotEmpty
                                             ? DecorationImage(
                                           fit: BoxFit.cover,
                                           image: NetworkImage(
                                             "${ApiUrl.imageUrl}${controller.homeDataList[index].images?[index].url}"
                                           , // Replace with your placeholder image URL
                                           ),
                                         ) : const DecorationImage(
                                           fit: BoxFit.cover,
                                           image:  AssetImage("assets/images/food_image.jpg"),
                                         ) , // No image decoration if data is empty or null
                                       ),
                                     ),
                                     const SizedBox(
                                       height: 12,
                                     ),
                                      CustomText(
                                       text:"${controller.homeModel.data?[index].name.toString()}",
                                       color: AppColors.blackNormal,
                                       fontSize: 14,
                                       fontWeight: FontWeight.w700,
                                     ),
                                      Row(
                                       children: [
                                         const Icon(Icons.location_on_outlined,color: AppColors.blackLightActive,),
                                         CustomText(text: controller.homeDataList[index].location.toString(),fontSize: 10,fontWeight: FontWeight.w300,color: AppColors.blackNormal,bottom: 12,top: 12,)
                                       ],
                                     ),

                                     CustomElevatedButton(onPressed: (){
                                       TableBookController dcontroller = Get.put(TableBookController());
                                       dcontroller.getTableData("${controller.homeModel.data?[index].sId}");
                                         print(controller.homeModel.data?[index].sId);

                                     }, titleText: "Book a Table",buttonHeight: 48,)

                                   ],
                                 ),
                               );
                             }),
                       ),
                       const SizedBox(height: 20,),
                       ///=============Explore Restaurants =============
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           const Column(
                             crossAxisAlignment:CrossAxisAlignment.start ,
                             children: [
                               CustomText(
                                 text: "Explore Restaurants",
                                 color: AppColors.blackNormal,
                                 fontSize: 16,
                                 fontWeight: FontWeight.w700,
                               ),
                               CustomText(
                                 text: "Check your city Near by Restaurant",
                                 color: AppColors.blackNormal,
                                 fontWeight: FontWeight.w300,
                               ),
                             ],
                           ),
                           controller.homeDataList.isEmpty? const CustomText(text: "",color: AppColors.greenNormal,fontSize: 24,fontWeight: FontWeight.w600,):  GestureDetector(
                               onTap: () {
                                 Get.to(const BookTableAll(title: 'Explore Restaurant',),
                                   arguments: {
                                     'dataLength': controller.homeDataList.length,
                                     'homeModel': controller.homeModel,

                                     // Include other parameters here
                                   },
                                 );
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
                       const SizedBox(height: 16,),
                       controller.homeDataList.isEmpty? const CustomText(text: "No Data Found",color: AppColors.greenNormal,fontSize: 24,fontWeight: FontWeight.w600,):   SizedBox(
                         height: 200,
                         width: Get.width,
                         child: ListView.builder(
                             itemCount: controller.homeModel.data!.length,
                             scrollDirection: Axis.horizontal,
                             itemBuilder: (context, index) {
                               return GestureDetector(
                                 onTap: () {

                                 },
                                 child: Container(
                                   margin: const EdgeInsets.only(right: 12),
                                  // padding: const EdgeInsets.all(12),
                                   decoration: BoxDecoration(

                                     color: AppColors.greenLight,
                                     borderRadius: BorderRadius.circular(12),
                                   ),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Container(
                                         height: 200,
                                         width: 120,
                                       //  padding: const EdgeInsets.all(8),
                                         decoration:  BoxDecoration(
                                             borderRadius:
                                             BorderRadius.circular(12),
                                             image: controller.homeModel.data?[index].images!=null && controller.homeModel.data![index].images!.isNotEmpty? DecorationImage(
                                               fit: BoxFit.fill,
                                               image: NetworkImage("${ApiUrl.imageUrl}${controller.homeModel.data?[index].images?[index].url}"),
                                             ):const DecorationImage(
                                               fit: BoxFit.fill,
                                               image: AssetImage("assets/images/food_image.jpg"),
                                             )
                                         )  ,

                                       ),
                                       const SizedBox(
                                         width: 8,
                                       ),

                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                                         children: [
                                            Row(
                                             children: [
                                               const Icon(Icons.location_on_outlined,color: AppColors.blackNormal,),
                                               CustomText(text: "${controller.homeModel.data?[index].location.toString()}",fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.blackNormal)
                                             ],
                                           ),

                                             Row(
                                             children: [
                                               Icon(Icons.star_rate_outlined,color: Colors.amber,),
                                              CustomText(text:"(${ controller.homeModel.data?[index].avgReviews.toString() ?? ""})",fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.blackNormal,)
                                             ],
                                           ),
                                         ///  const CustomText(text: "\$49",fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.blackNormal),
                                           // Wrap(
                                           //   children: List.generate(2, (index) {
                                           //     return Container(
                                           //       margin: const EdgeInsets.only(right: 4),
                                           //       padding: const EdgeInsets.all(4),
                                           //       decoration: BoxDecoration(
                                           //         borderRadius: BorderRadius.circular(4),
                                           //         border: Border.all(color: AppColors.blackNormal)
                                           //       ),
                                           //       child: const CustomText(text: "Chicken"),
                                           //     );
                                           //   }),
                                           //
                                           // ),
                                           CustomElevatedButton(onPressed: (){
                                             TableBookController dcontroller = Get.put(TableBookController());
                                             dcontroller.getTableData("${controller.homeModel.data?[index].sId}");
                                             print(controller.homeModel.data?[index].sId);
                                             Get.to(const TableBookingScreen());
                                           }, titleText: "Book a Table >",buttonHeight: 48,)
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                               );
                             }),
                       ),
                     ],
                   ),
                 ),
               )

            ],
          );
        }
      ),
        bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}
