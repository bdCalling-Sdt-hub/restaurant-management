import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavBar({required this.currentIndex, super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  var bottomNavIndex = 0;
    List<Widget> unselectedIcons = [
      const Icon(Icons.home_outlined, color: Colors.white),
      const Icon(Icons.favorite_border, color: Colors.white),
      const Icon(Icons.notifications_outlined, color: Colors.white),
      const Icon(Icons.person_2_outlined, color: Colors.white),
    ];
    List<Widget> selectedIcons = [
    const Icon(Icons.home_outlined, color: Colors.white),
    const Icon(Icons.favorite_border, color: Colors.white),
    const Icon(Icons.notifications_outlined, color: Colors.white),
    const Icon(Icons.person_2_outlined, color: Colors.white),
  ];
  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration:  BoxDecoration(
          color: AppColors.blackNormal,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            selectedIcons.length,
                (index) {
              return  GestureDetector(
                onTap: () => onTap(index),
                child: Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color:index==bottomNavIndex ? AppColors.greenNormal:AppColors.blackNormal,
                      boxShadow: index==bottomNavIndex ?  [
                      const BoxShadow(
                        color: Color(0xFF4C9A29
                        ),
                        blurRadius: 5,
                        offset: Offset(1, 3),
                        spreadRadius: 0,
                      )
                      ]: [
                       const BoxShadow(

                       )
                     ],
                   ),
                 padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),

                  child: index==bottomNavIndex? selectedIcons[index]:unselectedIcons[index],
                ),
              );
                }

          ),
        ),
      ),
    );
  }
  void onTap(int index) async {
    if (index == 0) {
      if (!(widget.currentIndex == 0)) {
       Get.toNamed(AppRoute.homeScreen);
      }
    } else if (index == 1) {
      if (!(widget.currentIndex == 1)) {
        Get.toNamed(AppRoute.favourite);
      }
    } else if (index == 2) {
      if (!(widget.currentIndex == 2)) {
        Get.toNamed(AppRoute.notification);
      }
    } else if (index == 3) {
      if (!(widget.currentIndex == 3)) {
        Get.toNamed(AppRoute.profile);
      }
    }
  }
}
