import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemCount: 12,itemBuilder: (context,index){
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Image.network("https://images.unsplash.com/photo-1585076800246-4562eb6d6f42?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8am9obiUyMGRvZXxlbnwwfHwwfHx8MA%3D%3D",height: 50,width: 50,),),
                 const Flexible(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       CustomText(text: "Cancelled Order",fontSize: 16,),
                       CustomText(top: 8,bottom: 8,left: 12,maxLines:5,text: "Booking cancelled Jose Hernández's appointment on Monday, Sep 20 at11:00 AM was cancelled.",color: Color(0xff696A69),)
                       ,CustomText(text: "10:pm"),
                       Divider(color: AppColors.greenNormal,)
                     ],
                   ),
                 )
              ],
            );
          }))
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 2),
    );
  }
}
