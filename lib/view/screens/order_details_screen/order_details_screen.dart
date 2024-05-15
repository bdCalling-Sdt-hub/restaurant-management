import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import '../../../../utils/app_colors.dart';
import '../../../controller/order_details_controller.dart';
import '../../widgets/custom_text.dart';

class OrderDetailsEcreen extends StatefulWidget {
  const OrderDetailsEcreen({super.key});
  @override
  State<OrderDetailsEcreen> createState() => _BookNowState();
}

class _BookNowState extends State<OrderDetailsEcreen> {
  final  id =  Get.arguments;

  @override
  void initState() {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    controller.orderDetailsData(id);
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
              onTap: () => Get.back(),
              child: Container(
                  margin: const EdgeInsets.only(left: 8),
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
          text: "Cart",
          color: AppColors.blackNormal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),

      ),
      body: GetBuilder<OrderDetailsController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:24,horizontal: 20),  child: Column(
              children: [
                controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.greenNormal,),):     Expanded(
                  child: ListView.builder(
                    itemCount: controller.model.data?.items?.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(top: 12, bottom: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xffC8E0BD),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image:   DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage("${ApiUrl.imageUrl}${controller.model.data?.items?[index].menu?.image}")
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 12,),
                                     Column(
                                      children: [
                                        CustomText(text: (controller.model.data?.items?[index].menu?.name.toString()??""), fontSize: 16),
                                         CustomText(text: "\$ ${controller.model.data?.items?[index].amount.toString()??""}", fontWeight: FontWeight.w500),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child:  CustomText(text: "Quantity: ${controller.model.data?.items?[index].quantity.toString()??""}", fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                         controller.model.data?.items?[index].isPaid == false? Positioned(
                            top: 10,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                controller.removeFromCart(bookingId: controller.model.data?.booking.toString() ?? "",
                                    itemId: controller.model.data?.items?[index].sId ?? "",
                                    amount: controller.model.data?.items?[index].amount.toString() ??"");
                                // setState(() {
                                //   controller.orderDetailsData(controller.model.data?.booking.toString() ?? "");
                                // });


                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.whiteColor,
                                ),
                                child: const Icon(Icons.close, size: 18),
                              ),
                            ),
                          ) : const SizedBox()
                        ],
                      );
                    },
                  ),


                ),
                ///=====================Amount=================================///
                Column(
                  children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(text: "Total Amount",fontWeight: FontWeight.w500,fontSize: 16,),
                        CustomText(text: "\$ ${controller.model.data?.totalAmount.toString()}",fontWeight: FontWeight.w500,fontSize: 16,)
                      ],
                    ),
                    const SizedBox(height: 8,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(text: "Total Due",fontWeight: FontWeight.w500,fontSize: 16,),
                        CustomText(text:"\$ ${controller.model.data?.totalDue}",fontWeight: FontWeight.w500,fontSize: 16,)
                      ],
                    ),
                    const SizedBox(height: 8,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(text: "Total Paid",fontWeight: FontWeight.w500,fontSize: 20,color: AppColors.greenNormal,),
                        CustomText(text: "\$ ${controller.model.data?.totalPaid}",fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.greenNormal,)
                      ],
                    ),
                    const SizedBox(height: 12,),
                    // CustomElevatedButton(onPressed: (){
                    // }, titleText: "Order Now",buttonHeight: 48,buttonWidth: Get.width/1.5,)
                  ],
                )
              ],
            ),
            );
          }
      ),
    );
  }
}
