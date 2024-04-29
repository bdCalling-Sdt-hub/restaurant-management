import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Row(
          children: [
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.only(left: 8),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),

                  child: const Icon(Icons.arrow_back,color: Colors.white,)),
            ),
          ],
        ),
        centerTitle: true,
        title:   const CustomText(text: "Sea Grill North Miami Beach",color: AppColors.blackNormal,fontSize: 24,fontWeight: FontWeight.w600,),
      ),

      body: Column(
        children: [
          SizedBox(
              height: 120,
          child: ListView.builder(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder:(context,index){
            return Container(
              margin: EdgeInsets.only(right: 12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: Color(0xffC8E0BD),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                children: [
                  Image.network("https://media.istockphoto.com/id/503818102/photo/mediterranean-pizza.jpg?s=1024x1024&w=is&k=20&c=KcMHR_aWxtBBuSC0gp0ccvT7EAYIxV6SGg7qTeHxrBg=",height: 60,width: 60,),
                  const CustomText(text: "Pizza")
                ],
              ),
            );
          },
          )),
SizedBox(height: 24,),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10 ),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent : 220,



              ),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(left: 8,bottom: 8),
                  color: AppColors.greenLight,
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                      width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4),
                            ),
                            image: DecorationImage(image:NetworkImage("https://media.istockphoto.com/id/503818102/photo/mediterranean-pizza.jpg?s=1024x1024&w=is&k=20&c=KcMHR_aWxtBBuSC0gp0ccvT7EAYIxV6SGg7qTeHxrBg="),fit: BoxFit.fill),)
                          ,),
                      FittedBox(child: CustomText(text: "PIZZA",color: AppColors.blackNormal,fontWeight: FontWeight.w700,)),
                       CustomText(text: "\$ 389.00",color: AppColors.blackNormal,),

                      CustomElevatedButton(onPressed: (){
                        Get.toNamed(AppRoute.orderDetailsScreen);


                      }, titleText: "Order",buttonHeight: 40,)
                    ],
                  )
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
