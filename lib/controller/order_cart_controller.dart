import 'package:get/get.dart';

class OrderCartController extends GetxController{
 int initialQuantity = 1;

 incrementQuantity(){
   initialQuantity ++;
   update();
 }
 decrementQuantity(){
   initialQuantity --;
   update();
 }
}