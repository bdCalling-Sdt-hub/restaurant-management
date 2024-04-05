//
//
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:united_anti_waste_food/utils/app_routes.dart';
// import '../../../utils/app_colors.dart';
//
// class CustomBottomNavBar extends StatefulWidget {
//   final int currentIndex;
//
//   const CustomBottomNavBar({required this.currentIndex, super.key});
//
//   @override
//   State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
// }
//
// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   var bottomNavIndex = 0;
//     List<Widget> unselectedIcons = [
//       const Icon(Icons.home_outlined, color: Colors.black),
//       const Icon(Icons.favorite_border, color: Colors.black),
//       const Icon(Icons.search, color: Colors.black),
//       const Icon(Icons.person_2_outlined, color: Colors.black),
//     ];
//     List<Widget> selectedIcons = [
//     const Icon(Icons.home_filled, color: Colors.white),
//     const Icon(Icons.favorite, color: Colors.white),
//     const FaIcon(Icons.search, color: Colors.white),
//     const Icon(Icons.person_3_rounded, color: Colors.white),
//   ];
//   List<String> navList = ["Home", "Favourite", "Search", "Profile"];
//   @override
//   void initState() {
//     bottomNavIndex = widget.currentIndex;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         alignment: Alignment.center,
//         decoration: const ShapeDecoration(
//           color: AppColors.olive_100,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(0),
//               topRight: Radius.circular(0),
//             ),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: List.generate(
//             unselectedIcons.length,
//                 (index) {
//               return  GestureDetector(
//                 onTap: () => onTap(index),
//                 child: Container(
//                   padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
//                   color:index==bottomNavIndex ? AppColors.olive_500:AppColors.olive_100,
//                   child: Column(
//                     children: [
//                      index==bottomNavIndex? selectedIcons[index]:unselectedIcons[index],
//                       Text(
//                         navList[index].tr,
//                         style: GoogleFonts.openSans(
//                             color: index == bottomNavIndex
//                                 ? AppColors.whiteColor
//                                 : AppColors.black_500,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//                 }
//
//           ),
//         ),
//       ),
//     );
//   }
//   void onTap(int index) async {
//     if (index == 0) {
//       if (!(widget.currentIndex == 0)) {
//        Get.toNamed(AppRoute.homeScreen);
//       }
//     } else if (index == 1) {
//       if (!(widget.currentIndex == 1)) {
//         Get.toNamed(AppRoute.favoriteScree);
//       }
//     } else if (index == 2) {
//       if (!(widget.currentIndex == 2)) {
//         Get.toNamed(AppRoute.searchScreen);
//       }
//     } else if (index == 3) {
//       if (!(widget.currentIndex == 3)) {
//         Get.toNamed(AppRoute.profileScreen);
//       }
//     }
//   }
// }
