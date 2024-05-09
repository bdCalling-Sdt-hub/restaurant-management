import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/utils/app_utils.dart';
import 'package:restaurant_management/view/screens/restaurant_wise_review_screen/restaurant_wise_review_screen.dart';
import 'package:restaurant_management/view/widgets/elevated_button.dart';
import '../../../controller/table_book_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';

class TableBookingScreen extends StatefulWidget {
  const TableBookingScreen({super.key});

  @override
  State<TableBookingScreen> createState() => _TableBookingScreenState();
}

class _TableBookingScreenState extends State<TableBookingScreen> {
  int currentPosition = 0;
  final CarouselController _carouselController = CarouselController();
final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          leading: Row(
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                    margin: const EdgeInsets.only(left: 12),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          actions: [
            Image.asset(
              "assets/images/logo.png",
              height: 44,
              width: 44,
            )
          ],
          centerTitle: true,
          title: const FittedBox(
              child: CustomText(
            text: "Sea Grill North Miami Beach",
            color: AppColors.blackNormal,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          )),
        ),
        body: GetBuilder<TableBookController>(builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.greenNormal,
                  ))
                : Column(
                    children: [
                      ///==============================image =============================================//
                      Column(
                        children: [
                          Stack(
                            children: [
                              CarouselSlider.builder(
                                carouselController: _carouselController,
                                itemCount: controller
                                    .tableBookModel.data?.images?.length,
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageIndex) =>
                                    Container(
                                  width: double.maxFinite,
                                  margin:
                                      const EdgeInsets.only(right: 5, left: 5),
                                  decoration: BoxDecoration(
                                    image: controller.tableBookModel.data?.images == null || controller.tableBookModel.data!.images!.isEmpty
                                        ? const DecorationImage(fit: BoxFit.fill, image: NetworkImage("assets/images/food_image.jpg"),): DecorationImage(fit: BoxFit.fill, image: NetworkImage(
                                                "${ApiUrl.imageUrl}${controller.tableBookModel.data?.images?[itemIndex].url}"),
                                          ),
                                    color: const Color(0xFFECECEC),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: Alignment.center,
                                ),
                                options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentPosition = index;
                                    });
                                  },
                                  enableInfiniteScroll: true,
                                  viewportFraction: 1,
                                  height: 180.0,
                                  // autoPlay: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 70),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 32,
                                      width: 32,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.blackNormal),
                                      child: IconButton(
                                          onPressed: () {
                                            _carouselController.previousPage();
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_double_arrow_left,
                                            size: 18,
                                            color: AppColors.whiteColor,
                                          )),
                                    ),
                                    Container(
                                      height: 32,
                                      width: 32,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.blackNormal),
                                      child: IconButton(
                                          onPressed: () {
                                            _carouselController.nextPage();
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_double_arrow_right,
                                            size: 18,
                                            color: AppColors.whiteColor,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: DotsIndicator(
                                    decorator: DotsDecorator(
                                      color: Colors.white,
                                      activeColor: AppColors.whiteColor,
                                      activeSize: const Size.square(12),
                                      size: const Size.square(8),
                                      activeShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // Adjust the radius as needed
                                      ),
                                      spacing: const EdgeInsets.all(2),
                                    ),
                                    dotsCount: controller.tableBookModel.data
                                            ?.images?.length ??
                                        1,
                                    position: currentPosition,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),

                      ///----------------------------------location------------------------------->

                      const SizedBox(
                        height: 12,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width / 2,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: AppColors.blackNormal,
                                ),
                                Flexible(
                                  child: CustomText(
                                      text: controller
                                              .tableBookModel.data?.location
                                              .toString() ??
                                          "",
                                      color: AppColors.blackNormal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      maxLines: 3),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 6,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                CustomText(
                                  text: controller
                                          .tableBookModel.data?.avgReviews
                                          .toString() ??
                                      "0",
                                  color: AppColors.blackNormal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

  ///========================= See all review  Button======================>>>

                      GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoute.restauratnWiseReviewScreen,arguments: controller.tableBookModel.data?.sId);
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 100,
                            alignment: Alignment.center,
                            padding: const EdgeInsetsDirectional.symmetric(vertical: 4,horizontal: 8),
                            decoration:  BoxDecoration(color: AppColors.greenNormal,borderRadius: BorderRadius.circular(4)),
                            child: const Row(
                              children: [
                                Icon(Icons.edit_note_outlined,color: AppColors.whiteColor,),
                                CustomText(text: "Review",color: AppColors.whiteColor,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                         
                      ///====================== Show open and closing time========================== ///////
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                          5,
                          (index){
                            print("time${controller.tableBookModel.data?.days?[index].openingTime}");
                            return Container(
                                margin: const EdgeInsets.all(4),
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? AppColors.greenNormalActive
                                        : AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: index % 2 == 0
                                            ? AppColors.whiteColor
                                            : AppColors.greenNormal,
                                        width: 0.5)),
                                child: Column(
                                  children: [
                                    CustomText(
                                        text:
                                        "${controller.tableBookModel.data?.days?[index].day}:",
                                        color: index % 2 == 0
                                            ? AppColors.whiteColor
                                            : AppColors.greenNormalActive,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                    CustomText(
                                      text: "${controller.formatTime(controller.tableBookModel.data?.days?[index].openingTime?? "")}-${controller.formatTime(controller.tableBookModel.data?.days?[index].closingTime?? "")}",
                                      color: index % 2 == 0 ? AppColors.whiteColor : AppColors.greenNormalActive,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ));
                          },
                        )),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: "Description",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.start,
                          )),
                      CustomText(
                          bottom: 24,
                          maxLines: 20,
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          text: controller.tableBookModel.data?.description
                                  .toString() ??
                              ""),

                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.validationTimePicker(context);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffCECECE),
                                  ),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.calendar_month_rounded,
                                    color: AppColors.blackNormalhover,
                                    size: 20,
                                  ),
                                  controller.validationController.text.isEmpty
                                      ? const CustomText(
                                          text: "Date",
                                          color: AppColors.blackNormalhover,
                                          fontSize: 10,
                                        )
                                      : CustomText(
                                          text:
                                              "${controller.validationController.text.substring(8, 10)}-${controller.validationController.text.substring(5, 7)}-${controller.validationController.text.substring(0, 4)}",
                                          color: AppColors.blackNormalhover,
                                          fontSize: 10,
                                        ),
                                  controller.validationController.text.isEmpty
                                      ? const Icon(
                                          Icons.keyboard_arrow_down_outlined)
                                      : const SizedBox()
                                ],
                              ),
                            ),
                          )),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.selectTime(context);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffCECECE)),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(Icons.alarm_sharp,
                                      color: AppColors.blackNormalhover,
                                      size: 20),
                                  CustomText(
                                    text: controller.selectedTime != null
                                        ? controller.selectedTime!
                                        : 'Time',
                                    color: AppColors.blackNormalhover,
                                    fontSize: 10,
                                  ),
                                  controller.selectedTime.toString().isEmpty
                                      ? const Icon(
                                          Icons.keyboard_arrow_down_outlined)
                                      : const SizedBox()
                                ],
                              ),
                            ),
                          )),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: Form(
                                key: formKey,
                                child: SizedBox(
                                  height: 40,
                                  child: TextFormField(
                                cursorColor: Colors.transparent,
                                cursorHeight: 16,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                controller: controller.personNoController,
                                decoration: const InputDecoration(

                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xffCECECE))),
                                    hintText: "Person",

                                    prefixIcon: Icon(Icons.group),
                                    contentPadding: EdgeInsets.all(0),
                                    border: OutlineInputBorder()),
                                // validator: (v){
                                //   if(v.toString().isEmpty){
                                //     return "is not empty";
                                //   }
                                // },
                                                            ),
                                                          ),
                              ))

                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomElevatedButton(
                        onPressed: () {
                          if(controller.personNoController.text.isEmpty || controller.selectedTime== null||controller.validationController.text.isEmpty){
                            Utils.toastMessage("Field can't be empty");
                          }
                          controller.bookTable(
                              controller.tableBookModel.data?.sId.toString() ??
                                  "");
                          // Get.to(const BookNow());
                        },
                        titleText: "Book Slots",
                        buttonHeight: 48,
                        buttonWidth: Get.width / 1.2,
                      )
                    ],
                  ),
          );
        }));
  }
}
