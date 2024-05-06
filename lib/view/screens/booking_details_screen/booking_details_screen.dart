import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_management/controller/single_booking_controller.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';
import '../../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});
  @override
  State<BookingDetailsScreen> createState() => _BookNowState();
}

class _BookNowState extends State<BookingDetailsScreen> {
  final  id =  Get.arguments[0];
  final  index =  Get.arguments[1];
  @override
  void initState() {
    GetSingleBookingController controller = Get.put(GetSingleBookingController());
    controller.getSingleBookingData(id,index);
    // TODO: implement initState
    super.initState();
  }
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
        title:const FittedBox(child: CustomText(text: "Booking Details",color: AppColors.blackNormal,fontSize: 24,fontWeight: FontWeight.w600,)),
      ),
      body: GetBuilder<GetSingleBookingController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 20),
              child: controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.greenNormal,)) :Column(
                children: [
                  // Image.asset("assets/images/img.png",height: 80,width: 80,),
                  // const Center(child: CustomText(text: "Table Booked Successfully",textAlign: TextAlign.center,fontWeight: FontWeight.w700,fontSize: 20,top: 12,bottom: 12,)),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_rounded,size: 18,),
                      CustomText(
                        text: controller.model.data?[0].date != null
                            ? DateFormat('yyyy-MM-dd').format(DateTime.parse(controller.model.data![0].date.toString()))
                            : "",
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        left: 12,
                      )


                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      const Icon(Icons.alarm_rounded,size: 18,),
                      CustomText(text: controller.model.data?[0].time.toString()??"",fontSize: 16,fontWeight: FontWeight.w300,left: 12,)
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      const Icon(Icons.group,size: 18,),
                      CustomText(text: controller.model.data?[0].table?.seats.toString()??"",fontSize: 16,fontWeight: FontWeight.w300,left: 12,)
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      const Icon(Icons.table_restaurant_outlined,size: 18,),
                      CustomText(text: controller.model.data?[0].table?.tableName.toString()??"",fontSize: 16,fontWeight: FontWeight.w300,left: 12,)
                    ],
                  ),
                  const SizedBox(height: 32,),
                  CustomElevatedButton(onPressed: (){
                    Get.toNamed(AppRoute.showOrderScreen,arguments: controller.model.data?[index].sId);

                    print("==================+ID ${controller.model.data?[index].sId}");

                  }, titleText: "Show Order",buttonHeight: 40,buttonWidth: Get.width/1.2,)
                ],
              ),
            );
          }
      ),
    );
  }
}
