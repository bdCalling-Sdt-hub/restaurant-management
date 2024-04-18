import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';

import '../../../controller/table_book_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/text_field.dart';

class TableBookingScreen extends StatefulWidget {
  const TableBookingScreen({super.key});

  @override
  State<TableBookingScreen> createState() => _TableBookingScreenState();
}

class _TableBookingScreenState extends State<TableBookingScreen> {


  @override
  Widget build(BuildContext context) {
    Get.put(TableBookController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Row(
          children: [
            GestureDetector(
              onTap: ()=>Get.back(),
              child: Container(
                margin: const EdgeInsets.only(left: 12),
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
          Image.asset("assets/images/logo.png",height: 44,width: 44,)
        ],
        centerTitle: true,
        title:const FittedBox(child: CustomText(text: "Sea Grill North Miami Beach",color: AppColors.blackNormal,fontSize: 24,fontWeight: FontWeight.w600,)),
      ),

      body:  GetBuilder<TableBookController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
            child: Column(
              children: [
                ///==============================image =============================================
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage("https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww"))
                  ),
                ),

                ///==========================================price------------------------------->
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width/2,
                      child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on,color: AppColors.blackNormal,),
                          Flexible(
                            child: CustomText(text: "3913 NE 163rd St North Miami Beach, FL 33160 ",
                                color: AppColors.blackNormal,fontSize: 14,fontWeight: FontWeight.w300,maxLines: 3),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width/6,
                      child:const Row(
                        children: [
                          Icon(Icons.star,color: Colors.yellow,),
                          CustomText(text: "4.5",color: AppColors.blackNormal,fontWeight: FontWeight.w500,fontSize: 20,)
                        ],
                      ),
                    ),
                  ],
                ),


                const Row(
                  children: [
                    Icon(Icons.alarm,color: AppColors.blackNormal,),
                    CustomText(text: "10:30 AM - 11:00 PM",color: AppColors.blackNormal,fontSize: 20,fontWeight: FontWeight.w500,left: 8,),
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

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            controller.validationTimePicker(context);
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(border: Border.all(color: const Color(0xffCECECE),
                          
                          ),borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.calendar_month_rounded,color: AppColors.blackNormalhover,size: 20,),
                             controller.validationController.text.isEmpty? const CustomText(text: "Date",
                               color: AppColors.blackNormalhover,fontSize: 10,): CustomText(text: controller.validationController.text,
                               color: AppColors.blackNormalhover,fontSize: 10,),
                           controller.validationController.text.isEmpty?Icon(Icons.keyboard_arrow_down_outlined):SizedBox()
                          ],
                          ),
                        ),
                      )
                    ),
                    Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              controller.selectTime(context);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(border: Border.all(color: const Color(0xffCECECE),

                            ),borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.alarm_sharp,color: AppColors.blackNormalhover,size: 20,),
                                controller.selectedTime.toString().isEmpty? const CustomText(text: "Time",
                                  color: AppColors.blackNormalhover,fontSize: 10,): CustomText(text: controller.selectedTime != null
                                    ?  '${controller.selectedTime!.hour}:${controller.selectedTime!.minute}'
                                    : 'Time',
                                  color: AppColors.blackNormalhover,fontSize: 10,),
                                controller.selectedTime.toString().isEmpty?const Icon(Icons.keyboard_arrow_down_outlined):SizedBox()
                              ],
                            ),
                          ),
                        )
                    ),
                    Expanded(
                      child: PopupMenuButton<String>(
                        onSelected: (String value) {
                          setState(() {
                            // Update the selected date or perform any other action based on the selected value
                            controller.validationController.text = value;
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: ' 1',
                              child: ListTile(
                                title: Text(' 1'),
                              ),
                            ),
                            const PopupMenuItem<String>(
                              value: '2',
                              child: ListTile(
                                title: Text('2'),
                              ),
                            ),
                            const PopupMenuItem<String>(
                              value: ' 3',
                              child: ListTile(
                                title: Text('3'),
                              ),
                            ),
                            // Add more PopupMenuItems as needed
                          ];
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffCECECE)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.group, color: AppColors.blackNormalhover, size: 20),
                              controller.validationController.text.isEmpty
                                  ? const CustomText(text: "Person", color: AppColors.blackNormalhover, fontSize: 10)
                                  : CustomText(text: controller.validationController.text, color: AppColors.blackNormalhover, fontSize: 10),
                              controller.validationController.text.isEmpty ? const Icon(Icons.keyboard_arrow_down_outlined) : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 16,),
                CustomElevatedButton(onPressed: (){
                }, titleText: "Find Slots",buttonHeight: 48,buttonWidth: Get.width/1.2,)
              ],
            ),
          );
        }
      )
    );
  }
}
