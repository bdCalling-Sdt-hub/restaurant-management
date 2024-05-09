import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/view/widgets/bottom_nav/bottom_nav.dart';

import '../../../controller/fovourite_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  // @override
  // void initState() {
  //
  //   FavouriteController controller = FavouriteController();
  //   controller.favouriteData();
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: const CustomText(
          text: "Favourite",
          color: AppColors.blackNormal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<FavouriteController>(
        builder: (controller) {
          return controller.isLoading? const Center(child: CircularProgressIndicator(color: AppColors.greenNormal,)): Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 20),
            child: controller.model.data == null || controller.model.data!.isEmpty?
            const Center(child: CustomText(text: "No Data Found",color: AppColors.greenNormal,fontSize: 24,fontWeight: FontWeight.w600,)):  Column(children: [
             const Divider(),
             Expanded(
               child: ListView.builder(
                 itemCount: controller.model.data?[0].menu?.length,
                 itemBuilder: (context,index){
                 return Column(
                   children: [
                     Padding(
                       padding: const EdgeInsetsDirectional.symmetric(vertical: 8,),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(
                             height: 60,
                             width: 60,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               image:  DecorationImage(
                                 fit: BoxFit.fill,
                                 image: NetworkImage("${ApiUrl.imageUrl}${controller.model.data?[0].menu?[index].image}"),
                               ),
                             ),
                           ),
                            CustomText(text: controller.model.data?[0].menu?[index].name.toString() ?? "",fontWeight:  FontWeight.w700,fontSize: 16,),
                            Row(
                             children: [
                               CustomText(text: "\$ ${controller.model.data?[0].menu?[index].price.toString() ?? ""}",fontWeight:  FontWeight.w500,fontSize: 14,),
                               const Icon(Icons.arrow_forward_ios,size: 16,)
                             ],
                           ),
                         ],
                       ),
                     ),
                     const Divider()
                   ],
                 );
               },),
             )
            ],),
          );
        }
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }
}
