
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_management/utils/app_colors.dart';
import 'package:restaurant_management/view/screens/menu/menu_screen.dart';
import 'package:restaurant_management/view/widgets/custom_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../controller/payment_controller.dart';
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentUrlClass paymentUrlClass = PaymentUrlClass();
  String ?finalPaymentUrl;

  WebViewController controller = WebViewController();
  @override
  void initState() {
    super.initState();
    fetchPaymentUrl(); // Call fetchPaymentUrl before creating WebViewController
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          // ... delegate methods
        ),
      );
  }
  // Fetch payment URL and update finalPaymentUrl
  void fetchPaymentUrl() async {
    await paymentUrlClass.fetchPaymentUrl();
    setState(() {
      finalPaymentUrl = PaymentUrlClass.finalPaymentUrl;
      controller.loadRequest(Uri.parse(finalPaymentUrl??"")); // Update controller here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
          automaticallyImplyLeading:true,
          centerTitle: true,

          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Make Payment'),
              Container(
                padding: const EdgeInsets.all(0),
                decoration:  BoxDecoration(
                  border: Border.all(color: AppColors.greenNormal),
                  borderRadius: BorderRadius.circular(24)
                ),
                child: TextButton(onPressed: (){
                  Get.to(const MenuScreen());
                }, child: const CustomText(text: "Go Order page")),
              ),
            ],
          )),
      body:paymentUrlClass.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.greenNormal,)): WebViewWidget(controller: controller),);
  }
}
