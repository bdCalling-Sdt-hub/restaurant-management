import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_management/controller/profile_controller/personal_info_controller.dart';
import 'package:restaurant_management/model/profile_model.dart';

import '../../global/api_url_container.dart';
import '../../global/share_prefes_helper.dart';
import '../../service/api_service.dart';
import '../../utils/app_utils.dart';

class EditPersonalInfoController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  String profileImage = "";

  // TextEditingController nameController = TextEditingController();
  ProfileModel? profileModel;

  File? imageFile;
  final imagePicker = ImagePicker();

  //String? imageUrl;
  bool isLoading = false;
  PersonalInfoController controller = Get.put(PersonalInfoController());

  /// ================ open gallery =========================///
  void openGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      int maxSize = 2 * 1024 * 1024; // 2 MB in bytes
      int fileSize = await pickedFile.length();
      if (fileSize <= maxSize) {
        imageFile = File(pickedFile.path);
        print("==============Image file${imageFile}");
        update();
      } else {
        Utils.toastMessage("Selected image exceeds the maximum size of 2 MB");
      }
    }
  }

  Future<void> editPersonalInfo() async {
    isLoading = true;
    update();
    Map<String, String> body = {
      'data': jsonEncode({
        "fullName": nameController.text,
        "phoneNumber": numberController.text,
      })
    };

    Map<String, String> mainHeader = {
      'Authorization': "Bearer ${PrefsHelper.accessToken}",
      'Content-Type': 'application/json',
    };

    print(mainHeader);

    var response = await ApiService.multipartRequest(
        url: ApiUrl.userUpdate,
        body: body,
        imagePath: imageFile,
        header: mainHeader,
        method: "PATCH");

    print(
        "=====================================>response ${response.responseJson}");
    print(
        "=====================================>response ${response.statusCode}");

    if (response.statusCode == 200) {
      Get.back();

      profileModel = null;
      controller.getPersonalInfoData();

      Utils.toastMessage(response.message);
    } else {
      Utils.toastMessage(response.message);
    }

    isLoading = false;
    update();
  }
}
