import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Row(
          children: [
            GestureDetector(
              onTap:()=>Get.back(),
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
        centerTitle: true,
        title:   const CustomText(text: "Order",color: AppColors.blackNormal,fontSize: 24,fontWeight: FontWeight.w600,),
      ),

      body: Column(
        children: [
          ListView.builder(itemBuilder: (context,index){

          })
        ],
      ),
    );
  }
}
