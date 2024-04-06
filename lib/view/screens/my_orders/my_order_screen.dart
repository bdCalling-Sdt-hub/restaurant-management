import 'package:flutter/material.dart';
import 'package:restaurant_management/view/widgets/custom_text.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';

import '../../../utils/app_colors.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  late TabController _abController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            Container(
              height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
        color: Colors.black,
                ),

                child: const Icon(Icons.arrow_back,color: Colors.white,)),
          ],
        ),

        centerTitle: true,
        title:   const CustomText(text: "My Orders",color: AppColors.blackNormal,fontSize: 24,fontWeight: FontWeight.w600,),
      ),

      body: Column(children: [


        TabBar(
         // indicatorColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 4),
          dividerHeight : 0,
          controller: _tabController,
          labelColor: AppColors.whiteColor, // Change this color as needed
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
            // Custom indicator for selected tab
            color: AppColors.greenNormal,
            borderRadius: BorderRadius.circular(32.0), // Change this color as needed
          ),
          tabs: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Tab(text: 'Completed'),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Tab(text: 'Processing'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Tab(text: 'Cancelled'),
            ),
          ],
        ),
        // const Divider(
        //   color: AppColors.blackNormalhover,
        // ),
        Expanded(
          child: TabBarView(
            controller: _tabController, // Specify the controller here
            children:   [
              // Content of Tab 1
              Center(child: OrderCard(status: 'Booked', textColor: AppColors.greenNormal,)),
              // Content of Tab 2
              Center(child: OrderCard(status: "Processing", textColor: Color(0xffC57600),)),
              Center(child: OrderCard(status: "Cancelled", textColor: Color(0xffE20505),)),
            ],
          ),
        ),
      ],),
    );
  }
}
class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.status, required this.textColor});
  final String status;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
      return Container(
        margin: const EdgeInsetsDirectional.symmetric(vertical: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),

            color: AppColors.whiteColor
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(text: "Nevada Coffee Bar",color: AppColors.blackNormal,fontWeight: FontWeight.w400,),
            const Row(
              children: [
                CustomText(text: "Tracking number:",color: AppColors.blackNormal,fontWeight: FontWeight.w400,),
                CustomText(text: "IW3475453455",color: AppColors.blackNormal,fontWeight: FontWeight.w400,),
              ],
            ),
            Row(
              children: const [
                CustomText(text: "Total Amount:",color: Color(0xff696969),fontWeight: FontWeight.w400,),
                CustomText(text: "112\$",color: AppColors.blackNormal,fontWeight: FontWeight.w400,),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(onPressed: (){
                }, titleText: "Details",borderColor: AppColors.greenNormal,buttonColor: AppColors.whiteColor,titleColor: AppColors.greenNormal,buttonRadius: 50,buttonHeight: 48,)
                ,
                CustomText(text: status,color: textColor,fontWeight: FontWeight.w500,)

              ],
            )

          ],
        ),
      );
    });
  }
}


