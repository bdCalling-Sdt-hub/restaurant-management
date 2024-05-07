import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_management/controller/notification-controller.dart';
import 'package:restaurant_management/view/widgets/bottom_nav/bottom_nav.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,

        centerTitle: true,
        title: const CustomText(
          text: "Notification",
          color: AppColors.blackNormal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<NotificationController>(
        builder: (controller) {
          return controller.isLoading?Center(child: CircularProgressIndicator(color: AppColors.greenNormal,)): Column(
            children: [
              Expanded(child: ListView.builder(
                  padding: EdgeInsetsDirectional.symmetric(vertical: 12),
                  itemCount: controller.model.data?.length,itemBuilder: (context,index){

                final String? timestampString = controller.model.data?[index].createdAt;
                DateTime? dateTime;
                if (timestampString != null) {
                  // Parse the timestamp string to DateTime object
                  dateTime = DateTime.parse(timestampString);
                }
                final formattedTime = dateTime != null ? DateFormat.Hm().format(dateTime!) : '';
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /*CircleAvatar(
                      child: Image.network("https://images.unsplash.com/photo-1585076800246-4562eb6d6f42?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8am9obiUyMGRvZXxlbnwwfHwwfHx8MA%3D%3D",height: 50,width: 50,),),*/
                      Flexible(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [

                           CustomText(top: 8,bottom: 8,left: 12,maxLines:5,text: controller.model.data?[index].message.toString() ?? "",color: const Color(0xff696A69),)
                           ,CustomText(text: formattedTime,top: 8,bottom: 8,left: 12,),
                           const Divider(color: AppColors.greenNormal,)
                         ],
                       ),
                     )
                  ],
                );
              }))
            ],
          );
        }
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
