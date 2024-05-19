import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/controller/show_order_controller.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/global/share_prefes_helper.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import '../../../../controller/order_details_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/elevated_button.dart';

class ShowOrderScreen extends StatefulWidget {
  const ShowOrderScreen({super.key});

  @override
  State<ShowOrderScreen> createState() => _BookNowState();
}

class _BookNowState extends State<ShowOrderScreen> {
  final id = Get.arguments;
  ShowOrderController controller = Get.put(ShowOrderController());

  @override
  void initState() {
    controller.showOrderData(id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(id);
    return GetBuilder<ShowOrderController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            leading: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                      margin: const EdgeInsets.only(left: 8),
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
            centerTitle: true,
            title: const CustomText(
              text: "Order",
              color: AppColors.blackNormal,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            actions: [
              controller.model.data?.items != null &&
                      controller.model.data!.items!.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        PrefsHelper.reOder = id;
                        Get.toNamed(AppRoute.showMenu);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 32,
                      ))
                  : const SizedBox()
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              children: [
                controller.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.greenNormal,
                        ),
                      )
                    : Expanded(
                        child: controller.model.data?.items != null &&
                                controller.model.data!.items!.isNotEmpty
                            ? ListView.builder(
                                itemCount:
                                    controller.model.data?.items?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        margin: const EdgeInsets.only(
                                            top: 12, bottom: 12),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffC8E0BD),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            "${ApiUrl.imageUrl}${controller.model.data?.items?[index].menu?.image}")),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                Column(
                                                  children: [
                                                    CustomText(
                                                        text: (controller
                                                                .model
                                                                .data
                                                                ?.items?[index]
                                                                .menu
                                                                ?.name
                                                                .toString() ??
                                                            ""),
                                                        fontSize: 16),
                                                    CustomText(
                                                        text:
                                                            "\$ ${controller.model.data?.items?[index].amount.toString() ?? ""}",
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: CustomText(
                                                      text:
                                                          "Quantity: ${controller.model.data?.items?[index].quantity.toString() ?? ""}",
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),

                                      ///====================Closed button  =================  ///
                                      controller.model.data?.items?[index]
                                                  .isPaid ==
                                              false
                                          ? Positioned(
                                              top: 10,
                                              right: 0,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    controller.removeFromCart(
                                                        bookingId: controller
                                                                .model
                                                                .data
                                                                ?.booking
                                                                .toString() ??
                                                            "",
                                                        itemId: controller
                                                                .model
                                                                .data
                                                                ?.items?[index]
                                                                .sId ??
                                                            "",
                                                        amount: controller
                                                                .model
                                                                .data
                                                                ?.items?[index]
                                                                .amount
                                                                .toString() ??
                                                            "",
                                                        orderId: id);
                                                    print("=====ID ${id}");
                                                  });
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.whiteColor,
                                                  ),
                                                  child: const Icon(Icons.close,
                                                      size: 18),
                                                ),
                                              ),
                                            )
                                          : const SizedBox()
                                    ],
                                  );
                                },
                              )
                            : IconButton(
                                onPressed: () {
                                  PrefsHelper.reOder = id;
                                  Get.toNamed(AppRoute.showMenu);
                                },
                                icon: Container(
                                  decoration: const ShapeDecoration(
                                      shape: CircleBorder(
                                          side: BorderSide(
                                              color: AppColors.greenNormal))),
                                  child: const Icon(
                                    Icons.add,
                                    size: 100,
                                    color: AppColors.greenNormal,
                                  ),
                                )),
                      ),

                ///=====================Amount=================================///
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: "Total Amount",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        CustomText(
                          text:
                              "\$ ${controller.model.data?.totalAmount.toString()}",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: "Total Due",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        CustomText(
                          text: "\$ ${controller.model.data?.totalDue}",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: "Total Paid",
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: AppColors.greenNormal,
                        ),
                        CustomText(
                          text: "\$ ${controller.model.data?.totalPaid}",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.greenNormal,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    controller.model.data?.totalDue != null &&
                            controller.model.data!.totalDue! > 0
                        ? CustomElevatedButton(
                            onPressed: () {},
                            titleText: "Order Now",
                            buttonHeight: 48,
                            buttonWidth: Get.width / 1.5,
                          )
                        : const SizedBox()
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
