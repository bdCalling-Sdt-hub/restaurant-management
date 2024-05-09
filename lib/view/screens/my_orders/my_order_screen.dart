import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/controller/booking_status_controller.dart';
import 'package:restaurant_management/controller/get_all_booking_data_controller.dart';
import 'package:restaurant_management/utils/app_colors.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/view/widgets/custom_text.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';
import '../review_screen/review_screen.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key, required this.text, required this.index, required this.status1, required this.status2, required this.status3});
 final String text;
 final int index;
final String status1;
final String status2;
final String status3;
  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;
   String text1 = "";
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
     text1 = widget.text;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.index,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom:TabBar(
           // controller: tabController1,
            onTap: (value){
              setState(() {
                if(value==0){
                text1 = "My Orders";
                }
                if(value==1){
                  text1 = "My Booking";
                }
              }
              );

            },
              dividerHeight : 1,
              indicatorColor: Colors.green,
              dividerColor: AppColors.greenLightActive,
              labelColor: AppColors.greenNormal, // Change this color as needed
              unselectedLabelColor: Colors.black26,
              tabs:  const [
           Tab(text: "Order",),
           Tab(text: "Booking",)
          ]),
          leading: Row(
            children: [
              GestureDetector(
                onTap: ()=>Get.back(),
                child: Container(
                 margin: const EdgeInsets.only(left: 16),
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
          centerTitle: true,
          title:  CustomText(text: text1,color: AppColors.blackNormal,fontSize: 24,fontWeight: FontWeight.w600,),
        ),
      
        body: TabBarView(
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                TabBar(
                 // indicatorColor: Colors.transparent,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 4),
                  dividerHeight : 0,
                  controller: tabController,
                  labelColor: AppColors.whiteColor, // Change this color as needed
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    // Custom indicator for selected tab
                    color: AppColors.greenNormal,
                    borderRadius: BorderRadius.circular(32.0), // Change this color as needed
                  ),
                  tabs:  const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Tab(text: "Unpaid"),
                    ),
                    // Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 8.0),
                    //   child: Tab(text:"Half Paid"),
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Tab(text:"Paid"),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController, // Specify the controller here
                    children: [
                      Center(child: OrderCard(status: widget.status1, textColor: AppColors.greenNormal,)),
                      Center(child: OrderCard(status: widget.status2, textColor: const Color(0xffC57600),)),
                      Center(child: OrderCard(status: widget.status3, textColor:  AppColors.greenNormal,)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                TabBar(
                 // indicatorColor: Colors.transparent,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 4),
                  dividerHeight : 0,
                  controller: tabController,
                  labelColor: AppColors.whiteColor, // Change this color as needed
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    // Custom indicator for selected tab
                    color: AppColors.greenNormal,
                    borderRadius: BorderRadius.circular(32.0), // Change this color as needed
                  ),
                  tabs:  const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Tab(text: "Booked"),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Tab(text: "Cancelled"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Tab(text: "Closed"),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController, // Specify the controller here
                    children:    const [
                      // Content of Tab 1
                      Center(child: BookingCard(status: "Booked", textColor: AppColors.greenNormal,)),
                      // Content of Tab 2
                      Center(child: BookingCard(status: "Cancelled", textColor: Color(0xffC57600),)),
                      Center(child: BookingCard(status: "Closed", textColor: Color(0xffE20505),)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}

///============================Order card design ====================///
class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.status, required this.textColor});
  final String status;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return   GetBuilder<OrderStatusController>(
      builder: (controller) {
        return controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.greenNormal,)): ListView.builder(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            itemCount: controller.model.data?.length ?? 0,
            itemBuilder: (context,index){
          return Container(
            margin: const EdgeInsetsDirectional.symmetric(vertical: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.whiteColor,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1E000000),
                  blurRadius: 24,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: controller.model.data?[0].items?[0].menu?.name.toString() ?? "" ,color: AppColors.blackNormal,fontWeight: FontWeight.w400,),
                 Row(
                  children: [

                    const CustomText(text: "Tracking number:",color: AppColors.blackNormal,fontWeight: FontWeight.w400,),
                   CustomText(text: controller.model.data?[index].booking?.bookingId.toString() ?? "",color: AppColors.blackNormal,fontWeight: FontWeight.w400,),

                  ],
                ),
                // const Row(
                //   children: [
                //     CustomText(text: "Total Amount:",color: Color(0xff696969),fontWeight: FontWeight.w400,),
                //     CustomText(text: "112\$",color: AppColors.blackNormal,fontWeight: FontWeight.w400,),
                //   ],
                // ),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(onPressed: (){
                      Get.toNamed(AppRoute.orderDetailsEcreen,arguments: controller.model.data?[index].id);
                      print("PrefsHelper =====>  ${controller.model.data?[index].id}");

                    }, titleText: "Details",borderColor: AppColors.greenNormal,buttonColor: AppColors.whiteColor,titleColor: AppColors.greenNormal,buttonRadius: 50,buttonHeight: 40,)
                    ,
                    CustomText(text: status,color: textColor,fontWeight: FontWeight.w500,)

                  ],
                )

              ],
            ),
          );
        });
      }
    );
  }
}

///============================Booking card design ====================///
class BookingCard extends StatelessWidget {
  const BookingCard({super.key, required this.status, required this.textColor});
  final String status;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return   GetBuilder<GetAllBookingDataController>(
        builder: (controller) {
          return controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.greenNormal,)): ListView.builder(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              itemCount: controller.model.data?.length ,
              itemBuilder: (context,index){
                return Container(
                  margin: const EdgeInsetsDirectional.symmetric(vertical: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1E000000),
                        blurRadius: 24,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: controller.model.data?[index].restaurant?.name.toString() ??"" ,color: AppColors.blackNormal,fontWeight: FontWeight.w400,),
                      Row(
                        children: [
                          const CustomText(text: "Tracking number:",color: AppColors.blackNormal,fontWeight: FontWeight.w400,),
                          CustomText(text: controller.model.data?[index].id.toString() ?? "",color: AppColors.blackNormal,fontWeight: FontWeight.w400,),
                        ],
                      ),
                      // const Row(
                      //   children: [
                      //     CustomText(text: "Total Amount:",color: Color(0xff696969),fontWeight: FontWeight.w400,),
                      //     CustomText(text: "112\$",color: AppColors.blackNormal,fontWeight: FontWeight.w400,),
                      //   ],
                      // ),
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomElevatedButton(onPressed: (){

                              Get.toNamed(AppRoute.bookingDetails,arguments:[controller.model.data?[index].sId ,index] );


                          }, titleText: "Details",borderColor: AppColors.greenNormal,buttonColor: AppColors.whiteColor,titleColor: AppColors.greenNormal,buttonRadius: 50,buttonHeight: 40,)
                          ,
                          CustomText(text: status,color: textColor,fontWeight: FontWeight.w500,)

                        ],
                      )

                    ],
                  ),
                );
              });
        }
    );
  }
}


