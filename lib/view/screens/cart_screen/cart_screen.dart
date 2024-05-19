import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/controller/order_cart_controller.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/global/share_prefes_helper.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:restaurant_management/view/screens/payment_screen/payment_screen.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/elevated_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  OrderCartController controller = Get.put(OrderCartController());

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        controller.getAllCartData(PrefsHelper.afterbookingId);
      },
    );

    // TODO: implement initState
    super.initState();
  }

// final menuId  =  Get.arguments;
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
          text: "Cart",
          color: AppColors.blackNormal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(AppRoute.showMenu);
            },
            child: const CircleAvatar(
                backgroundColor: AppColors.greenNormal,
                child: ClipOval(
                    child: Icon(
                  Icons.add,
                  color: AppColors.whiteColor,
                  size: 40,
                ))),
          ),
          const SizedBox(
            width: 25,
          )
        ],
      ),
      body: GetBuilder<OrderCartController>(builder: (controller) {
        return Padding(
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
                      child: controller.carList.isEmpty
                          ? const Center(
                              child: CustomText(
                                text: "No data found",
                                fontSize: 24,
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller.carList.length,
                              itemBuilder: (context, index) {
                                var item = controller.carList[index];
                                return Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      margin: const EdgeInsets.only(
                                          top: 12, bottom: 12),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffC8E0BD),
                                        borderRadius: BorderRadius.circular(12),
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
                                                      BorderRadius.circular(8),
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        "${ApiUrl.imageUrl}${item.menu?.image}"),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Column(
                                                children: [
                                                  CustomText(
                                                      text: (item.menu?.name
                                                              .toString() ??
                                                          ""),
                                                      fontSize: 16),
                                                  CustomText(
                                                      text:
                                                          "\$ ${(item.amount.toString() ?? "")}",
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
                                                      BorderRadius.circular(8),
                                                ),
                                                child: CustomText(
                                                    text:
                                                        "Quantity: ${(item.quantity.toString() ?? "")}",
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    controller.isLoadingClose
                                        ? const CircularProgressIndicator()
                                        : Positioned(
                                            top: 10,
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.removeFromCart(
                                                    item.id.toString() ?? "",
                                                    item.amount.toString() ??
                                                        "",
                                                    PrefsHelper.afterbookingId);
                                                print(
                                                    "=====ID ${item.id.toString() ?? ""}");
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.whiteColor,
                                                ),
                                                child: const Icon(Icons.close,
                                                    size: 18),
                                              ),
                                            ),
                                          )
                                  ],
                                );
                              },
                            ),
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
                            "\$ ${(controller.model.data?.totalAmount ?? "")}",
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
                        text: "\$ ${(controller.model.data?.totalDue ?? "")}",
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
                        text: "\$ ${(controller.model.data?.totalPaid ?? "")}",
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
                          controller.model.data?.totalDue != 0
                      ? controller.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: AppColors.greenNormal,
                            ))
                          : CustomElevatedButton(
                              onPressed: () {
                                Get.toNamed(AppRoute.paymentScreen,
                                    arguments: controller.model.data?.totalDue);
                              },
                              titleText: "Order Now",
                              buttonHeight: 48,
                              buttonWidth: Get.width / 1.5,
                            )
                      : const SizedBox()
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
