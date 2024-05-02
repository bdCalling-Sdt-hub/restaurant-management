import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/controller/order_cart_controller.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/global/share_prefes_helper.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/elevated_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
@override
  void initState() {

 OrderCartController controller =  Get.put(OrderCartController());

 controller.getAllCartData(PrefsHelper.afterbookingId);
    // TODO: implement initState
    super.initState();
  }

final menuId  =  Get.arguments;
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
                margin: EdgeInsets.only(left: 4),
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
          text: "Order",
          color: AppColors.blackNormal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<OrderCartController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:24,horizontal: 20),  child: Column(
              children: [
           controller.isLoading?Center(child: CircularProgressIndicator(color: AppColors.greenNormal,),):     Expanded(
                  child: ListView.builder(
                    itemCount: controller.carList.length,
                    itemBuilder: (context, index) {
                      print(controller.carList.length,);
                      return Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            margin: EdgeInsets.only(top: 12, bottom: 12),
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
                                        image:  DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage("${ApiUrl.imageUrl}${controller.model.data?.items?[index].menu?.image}"),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 12,),
                                     Column(
                                      children: [
                                        CustomText(text: (controller.model.data?.items?[index].menu?.name.toString()??""), fontSize: 16),
                                        CustomText(text: "\$ ${(controller.model.data?.items?[index].amount.toString()??"")}", fontWeight: FontWeight.w500),
                                      ],
                                    ),
                                  ],
                                ),
                               /* Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 12,right: 24),
                                      width: Get.width / 3,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            onPressed: controller.initialQuantity == 1 ? null : () {
                                              controller.decrementQuantity();
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              color: controller.initialQuantity == 1 ? const Color(0xffBDB4AC) : AppColors.blackNormal,
                                            ),
                                          ),
                                          CustomText(
                                            text: controller.initialQuantity.toString(),
                                            color: AppColors.greenNormal,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              controller.incrementQuantity();
                                            },
                                            icon: const Icon(Icons.add, color: AppColors.blackNormal),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )*/
                              ],
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                controller.removeFromCart(controller.model.data?.items?[index].sId.toString() ??  "",controller.model.data?.items?[index].amount.toString() ?? "");

                                print("=====ID ${controller.model.data?.items?[index].sId.toString() ?? ""}");
                                }
                                );
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                child: Icon(Icons.close, size: 18),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),


                ),
               ///=====================Amount=================================///
               Column(
                 children: [
                   // Row(
                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //   children: [
                   //     CustomText(text: "Sub Total",fontWeight: FontWeight.w500,fontSize: 16,),
                   //     CustomText(text: "\$1234.00",fontWeight: FontWeight.w500,fontSize: 16,)
                   //   ],
                   // ),
                   // SizedBox(height: 8,),
                   // Row(
                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //   children: [
                   //     CustomText(text: "Discount",fontWeight: FontWeight.w500,fontSize: 16,),
                   //     CustomText(text: "\$12.00",fontWeight: FontWeight.w500,fontSize: 16,)
                   //   ],
                   // ),
                   SizedBox(height: 8,),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       CustomText(text: "Total",fontWeight: FontWeight.w500,fontSize: 20,color: AppColors.greenNormal,),
                       CustomText(text: "\$ ${(controller.model.data?.totalAmount ?? "")}",fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.greenNormal,)
                     ],
                   ),
                   SizedBox(height: 12,),
                   CustomElevatedButton(onPressed: (){
                   }, titleText: "Order Now",buttonHeight: 48,buttonWidth: Get.width/1.5,)
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
