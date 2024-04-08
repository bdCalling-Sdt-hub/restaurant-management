import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:restaurant_management/controller/product_deatails_controller.dart';

import '../../../utils/app_colors.dart';
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
            Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: const Icon(Icons.arrow_back,color: Colors.white,)),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline_outlined))
        ],
        centerTitle: true,
        title:const CustomText(text: "Details",color: AppColors.blackNormal,fontSize: 24,fontWeight: FontWeight.w600,),
      ),
      body:  GetBuilder<ProductDetailsController>(
        builder: (controller) {
          return Column(
            children: [
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
            ],
          );
        }
      ),
    );
  }
}
