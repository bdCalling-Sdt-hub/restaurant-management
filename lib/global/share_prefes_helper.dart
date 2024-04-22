import 'package:get/get.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper extends GetxController {
  static String token = "";
  static String otpToken = "";
  static String email = "";
  static bool isLogin = false;

  static String refreshToken = "";


  ///<<<======================== Get All Data Form Shared Preference ==============>

  static Future<void> getAllPrefData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString("token") ?? "";
    otpToken = preferences.getString("token") ?? "";
    email = preferences.getString("email") ?? "";
    refreshToken = preferences.getString("refreshToken") ?? "";

  }

  ///<<<======================== Get Data Form Shared Preference ==============>

  static Future<bool?> getBool(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
  }

  static Future<int> getInt(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key) ?? (-1);
  }

  ///<<<=====================Save Data To Shared Preference=====================>

  static Future setString(String key, value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  static Future setBool(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool(key, value);
  }

  static Future setInt(String key, int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setInt(key, value);
  }

  ///<<<==========================Remove Value==================================>

  static Future remove(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove(key);
  }

  ///<<<======================== Get All Data Form Shared Preference ============>
  static Future<void> logOut() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
      pref.setString("refreshToken", "");
      pref.setString("token", "");

      token = "";
      isLogin = false;
      refreshToken = "";
      Get.offAllNamed(AppRoute.signin);
    } catch (e) {
      print(e.toString());
    }
  }
}
