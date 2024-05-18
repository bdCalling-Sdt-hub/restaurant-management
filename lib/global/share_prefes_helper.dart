import 'package:get/get.dart';
import 'package:restaurant_management/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper extends GetxController {
  static String accessToken = "";
  static String otpToken = "";
  static String forgotToken = "";
  static String forgotMail = "";
  static String email = "";
  static String userId = "";
  static String userIdForNotification = "";
  static bool isLogIn = false;
  static String refreshToken = "";
  static String bookingId = "";
  static String afterbookingId = "";
  static String reOder = "";

  ///<<<======================== Get All Data Form Shared Preference ==============>

  static Future<void> getAllPrefData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    accessToken = preferences.getString("accessToken") ?? "";
    otpToken = preferences.getString("token") ?? "";
    forgotToken = preferences.getString("forgotToken") ?? "";
    email = preferences.getString("email") ?? "";
    refreshToken = preferences.getString("refreshToken") ?? "";
    forgotMail = preferences.getString("forgotEmail") ?? "";
    bookingId = preferences.getString("bookingId") ?? "";
    afterbookingId = preferences.getString("afterbookingId") ?? "";
    afterbookingId = preferences.getString("userId") ?? "";
    afterbookingId = preferences.getString("userIdForNotification") ?? "";
    isLogIn = preferences.getBool("isLogIn") ?? false;

    print("==================> Save Access token $accessToken");
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

      accessToken = "";
      isLogIn = false;
      refreshToken = "";
      Get.offAllNamed(AppRoute.signin);
    } catch (e) {
      print(e.toString());
    }
  }
}
