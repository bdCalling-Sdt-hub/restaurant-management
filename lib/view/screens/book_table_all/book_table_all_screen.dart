import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';
import '../table_booking_screen/table_booking_screen.dart';

class BookTableAll extends StatelessWidget {
   const BookTableAll({super.key, required this.title});
 final String title;
  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    var dataLength = arguments['dataLength'];
    var homeModel = arguments['homeModel'];
    print("${ApiUrl.imageUrl}${homeModel.data[0].images?[0].url}");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Row(
          children: [
            GestureDetector(
              onTap: ()=>Get.back(),
              child: Container(
                margin: const EdgeInsets.only(left: 16),
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
        title: CustomText(text: title,color: AppColors.blackNormal,fontSize: 24,fontWeight: FontWeight.w600,),
      ),
      body: Column(
        children: [
           const Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomTextField(
              fieldBorderColor: Colors.transparent,
              focusBorderColor: Colors.transparent,
              fillColor: Color(0xffE6E7E9),
              hintText: "Search",
              isPrefixIcon: true,
              icon: Icon(Icons.search,color: AppColors.blackLightActive,),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: dataLength,
                padding: const EdgeInsetsDirectional.symmetric(vertical: 24,horizontal: 20),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.greenLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 260,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(12),
                              image: homeModel.data[index].images!=null && homeModel.data[index].images!.isNotEmpty? DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("${ApiUrl.imageUrl}${homeModel.data[index].images?[index].url}"),
                              ): const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                              )
                          ),
            
                        ),
                        const SizedBox(
                          height: 12,
                        ),
            
                         CustomText(
                          text:homeModel.data[index].name.toString(),
                          color: AppColors.blackNormal,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                         Row(

                         mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_outlined,color: AppColors.blackLightActive,),
                            CustomText(text: homeModel.data[index].location.toString(),fontSize: 20,fontWeight: FontWeight.w300,color: AppColors.blackNormal,bottom: 12,top: 12,)
                          ],
                        ),
            
                        CustomElevatedButton(onPressed: (){
                          Get.to(const TableBookingScreen());
            
                        }, titleText: "Book a Table",buttonHeight: 48,titleSize: 16,buttonWidth: Get.width/2,titleWeight: FontWeight.w500,)
            
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
