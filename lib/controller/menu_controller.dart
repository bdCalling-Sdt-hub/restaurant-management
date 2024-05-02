import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_management/global/api_url_container.dart';
import 'package:restaurant_management/model/menu_category_model.dart';
import 'package:restaurant_management/model/menu_model.dart';
import 'package:restaurant_management/service/api_service.dart';


class MenuControllerGet extends GetxController {
  MenuCategotyModel menuCategotyModel = MenuCategotyModel();
  List menuCategoryList =  [];
  bool isLoading = false;

  ///==================getMenuCategory===============//

  Future<void> getMenuCategory() async {
    isLoading = true;
    update();
    var response = await ApiService.getApi(ApiUrl.menuCategory);
    if (kDebugMode) {
      print("===================Response${response.responseJson}");
    }
    if (response.statusCode == 200) {
      menuCategotyModel = MenuCategotyModel.fromJson(jsonDecode(response.responseJson));

      if (kDebugMode) {
        print(response.responseJson);
      }
      if (kDebugMode) {
        print(response.message);
      }

      if(menuCategotyModel.data != null){
        menuCategoryList.addAll(menuCategotyModel.data!);
        update();
      }
      print("=====================================>>> ${menuCategoryList.length}");
    }
    isLoading = false;
    update();
  }

  ///==================get MeNu ===============??

  MenuModel menuModel = MenuModel();

 List<Data> menuList  = [];

  Future<void> getMenu({required dynamic categoryId}) async {
    isLoading = true;
    update();
    menuList.clear();
    String url = "${ApiUrl.menuEndPoint}?category=$categoryId";
    print(url);
    var response = await ApiService.getApi(url);
    print("===================Menu Response${response.responseJson}");

    if (response.statusCode == 200) {
      menuModel = MenuModel.fromJson(jsonDecode(response.responseJson));
      if(menuModel.data != null && menuModel.data!.isNotEmpty){
        menuList.addAll(menuModel.data!);
        update();
      }
      print(response.responseJson);
      print("dfgkl sd\f;gkl sd\fk dsf\;gkl sd\'gk \g;kl  ${response.message}");
    }
    isLoading = false;
    update();
  }

  ///==============SelectCategory ==================//

  int selectedCategory = 0;
  getId(int index) {
    selectedCategory = index;
    update();
  }

  @override
  void onInit() {
    getMenuCategory();
    // getMenu(categoryId: PrefsHelper.afterbookingId);
    // TODO: implement onInit
    super.onInit();
  }
}
