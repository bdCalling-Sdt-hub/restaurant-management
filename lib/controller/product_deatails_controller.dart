import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  int initialQuantity = 1 ;

  incrementQuantity(){
    initialQuantity++;
    update();
  }
  decrementQuantity(){
    if(initialQuantity>1)
    {
      initialQuantity--;
      update();
    }

  }
}