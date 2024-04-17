import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditPersonalInfoController extends GetxController{
  /// ============================Pick image==========================================///
  ///from gallery///
  File? imageFile;
  final imagePicker = ImagePicker();
  String? imageUrl;
  void openGallery() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      update();
    }
  }
}