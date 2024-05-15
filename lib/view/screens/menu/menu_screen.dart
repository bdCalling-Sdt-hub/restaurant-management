import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/controller/booking_status_controller.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';

import '../../../controller/menu_controller.dart';
import '../../../global/share_prefes_helper.dart';
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
                margin: const EdgeInsets.only(left: 8),
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
        title:   const CustomText(text: "Sea Grill North Miami Beach",color: AppColors.blackNormal,fontSize: 24,fontWeight: FontWeight.w600,),
      ),

      body: GetBuilder<MenuControllerGet>(
        builder: (controller) {
          return controller.isLoading ? const Center(child: CircularProgressIndicator(color: AppColors.greenNormal,)): Column(
            children: [
             GestureDetector(
               onTap: (){
               },
               child: SizedBox(
                    height: 120,
                child: ListView.builder(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.menuCategoryList.length,
                  itemBuilder:(context,index){
                  return GestureDetector(
                    onTap: () async{
                      controller.getId(index);
                      controller.getMenu(categoryId: controller.menuCategoryList[index].id.toString());
                    },
                    child:  Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: controller.selectedCategory == index ? AppColors.blackLightActive: const Color(0xffC8E0BD),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        children: [
                          Image.network("${ApiUrl.imageUrl}${controller.menuCategoryList[index].image}",height: 60,width: 60,),
                           CustomText(text: controller.menuCategoryList[index].title.toString() ?? "",color: controller.selectedCategory == index?AppColors.whiteColor : AppColors.blackNormal,)
                        ],
                      ),
                    ),
                  );
                },
                )),
             ),
               const SizedBox(height: 24,),
         ///===================================== All Menu data =================================>>>
             controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.greenNormal,),): Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10 ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent : 220,
                  ),
                  itemCount: controller.menuList.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("Length =======>>${controller.menuList.length}");
                    return  Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(left: 8,bottom: 8),
                      color: AppColors.greenLight,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                          width: MediaQuery.of(context).size.width,
                              decoration:  BoxDecoration(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4),
                                ),
                                image: DecorationImage(image:NetworkImage("${ApiUrl.imageUrl}${controller.menuList[index].image.toString()}"),fit: BoxFit.fill),)
                              ,),
                           FittedBox(child: CustomText(text: controller.menuList[index].name.toString(),color: AppColors.blackNormal,fontWeight: FontWeight.w700,)),
                            CustomText(text: "\$ ${controller.menuList[index].price.toString()}",color: AppColors.blackNormal,),

                          CustomElevatedButton(onPressed: (){
                            Get.toNamed(AppRoute.orderDetailsScreen,arguments: controller.menuList[index].id);
                          }, titleText: "Order",buttonHeight: 40,)
                        ],
                      )
                    );
                  },
                ),
              ),

            ],
          );
        }
      ),
    );
  }
}
