import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/controller/restaurant_wise_review_controller.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/utils/app_colors.dart';
import 'package:restaurant_management/view/widgets/custom_text.dart';

class RestauratnWiseReviewScreen extends StatefulWidget {
  const RestauratnWiseReviewScreen({super.key});

  @override
  State<RestauratnWiseReviewScreen> createState() => _RestauratnWiseReviewScreenState();
}

class _RestauratnWiseReviewScreenState extends State<RestauratnWiseReviewScreen> {
  @override
  void initState() {
    final restaurantId = Get.arguments;
    RestaurantWiseReviewController controller = Get.put(RestaurantWiseReviewController());
    controller.getAllReviews(restaurantId: restaurantId);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "All Reviews",fontWeight: FontWeight.w600,fontSize: 18,),
        centerTitle: true,
      ),
      body: GetBuilder<RestaurantWiseReviewController>(
        builder: (controller) {
          return controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.greenNormal,),): Column(
            children: [
              Expanded(child: ListView.builder(
                itemCount: controller.model.data?.length,
                  itemBuilder: (context,index){
                  print(controller.model.data?[index].comment?? "");
                     return  Container(
                            padding: const EdgeInsets.all(12),
                         margin: const EdgeInsets.only(bottom: 8,left: 20,right: 20),
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                         border: Border.all(width: 0.3),
                           color: AppColors.whiteColor,
                           boxShadow: const [
                             BoxShadow(
                               color: Color(0x1E000000),
                               blurRadius: 24,
                               offset: Offset(0, 1),
                               spreadRadius: 0,
                             )
                           ],
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: NetworkImage("${ApiUrl.imageUrl}${controller.model.data?[index].user?.image}"),fit: BoxFit.fill)
                                ),
                              ),
                             CustomText(text: controller.model.data?[index].comment?? "",color: AppColors.blackNormalhover,top: 4,bottom: 4,),
                             CustomText(text: controller.model.data?[index].user?.fullName?? "",color: AppColors.blackNormal,fontSize: 18,),
                             Row(
                               children: [
                                 CustomText(text: "(${controller.model.data?[index].rating?? ""})",color: AppColors.blackNormal,fontSize: 18,),
                                 Icon(Icons.star_rate_outlined,color: Colors.amber,size: 24,)
                               ],
                             ),
                           ],
                         ));
              }
              )
              )
            ],
          );
        }
      ),
    );
  }
}
