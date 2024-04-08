import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';

class OrderCartScreen extends StatefulWidget {
  const OrderCartScreen({super.key});

  @override
  State<OrderCartScreen> createState() => _OrderCartScreenState();
}

class _OrderCartScreenState extends State<OrderCartScreen> {
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
        centerTitle: true,
        title:   const CustomText(text: "Order",color: AppColors.blackNormal,fontSize: 24,fontWeight: FontWeight.w600,),
      ),
    );
  }
}
