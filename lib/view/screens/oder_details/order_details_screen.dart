import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:restaurant_management/controller/product_deatails_controller.dart';
import 'package:restaurant_management/view/screens/cart_screen/cart_screen.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import '../../widgets/custom_text.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final controller = Get.put(ProductDetailsController());
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
          IconButton(onPressed: (){

          }, icon: const Icon(Icons.favorite_outline_outlined))
        ],
        centerTitle: true,
        title:const CustomText(text: "Details",color: AppColors.blackNormal,fontSize: 24,fontWeight: FontWeight.w600,),
      ),
      body:  GetBuilder<ProductDetailsController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24,horizontal: 20),
            child: Column(
              children: [
                ///==============================image =============================================
                Container(
                  height: 310,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww"))
                  ),
                ),
                   ///============================increment /decrement =========================///
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(8),
                  width: Get.width/3,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffE3DCD5)),
                    borderRadius: BorderRadius.circular(32)
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: controller.initialQuantity==1?null: (){
                       controller.decrementQuantity();
                      },
                          icon:  Icon(Icons.remove,color: controller.initialQuantity==1?const Color(0xffBDB4AC):AppColors.blackNormal,)),
                      CustomText(text: controller.initialQuantity.toString(),color: AppColors.greenNormal,),
                      IconButton(onPressed: (){
                        controller.incrementQuantity();
                      }, icon: const Icon(Icons.add,color: AppColors.blackNormal,))
                    ],
                  ),
                ),
            ///==========================================price------------------------------->
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Chesese burger",color: AppColors.blackNormal,fontSize: 20,fontWeight: FontWeight.w500,),
                    Row(
                      children: [
                             Icon(Icons.star,color: Colors.yellow,),
                             CustomText(text: "4.5",color: AppColors.blackNormal,fontWeight: FontWeight.w500,fontSize: 20,)
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(text: "\$123",color: AppColors.blackNormal,fontSize: 20,fontWeight: FontWeight.w500,),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.greenNormal,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: const Row(
                        children: [
                               Icon(Icons.edit_calendar_outlined,color: Colors.white,size: 14,),
                               CustomText(text: "Review",color: AppColors.whiteColor,fontWeight: FontWeight.w300,fontSize: 10,)
                        ],
                      ),
                    )
                  ],
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(text: "Description",fontSize: 16,fontWeight: FontWeight.w500,textAlign: TextAlign.start,)),
                const CustomText(
                  bottom: 24,
                    maxLines: 20,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    text: "Our classic cheeseburger is made with a fresh, never-frozen beef patty that is cooked to perfection and topped with melted American cheese, lettuce, tomato, pickles, and onions. It is served on a toasted bun and is sure to satisfy your hunger."),
                CustomElevatedButton(onPressed: (){

                       Get.toNamed(AppRoute.orderCartScreen);
                }, titleText: "Order",buttonHeight: 48,buttonWidth: Get.width/1.5,)
              ],
            ),
          );
        }
      ),
    );
  }
}
