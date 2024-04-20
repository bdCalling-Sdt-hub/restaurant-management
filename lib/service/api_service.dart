import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import '../global/api_response_model.dart';
import '../global/share_prefes_helper.dart';

class ApiService {
  static const int timeOut = 30;
  ///<<<======================== Post Request  ==============================>>>

  static Future<ApiResponseModel> postApi(String url, body, {Map<String, String>? header}) async {
    dynamic responseJson;

    Map<String, String> mainHeader = {
      'Authorization': PrefsHelper.token,
    };

    print("==================================================> url $url");
    print("==================================================> body $body");
    print("==================================================> mainHeader $mainHeader");

    try {
      final response = await http.post(Uri.parse(url), body: body, headers: header ?? mainHeader).timeout(const Duration(seconds: timeOut));
      responseJson = handleResponse(response);
      print(response.body);
    } on SocketException {
      //Get.toNamed(AppRoute.noInternet);
      return ApiResponseModel(503, "No internet connection".tr, '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request".tr, '');
    } on TimeoutException {
      return ApiResponseModel(408, "Request Time Out".tr, "");
    }
    return responseJson;
  }



  ///<<<======================== Get Request ==============================>>>

  static Future<ApiResponseModel> getApi(String url, {Map<String, String>? header}) async {
    dynamic responseJson;

    Map<String, String> mainHeader = {
      'Authorization': PrefsHelper.token,
    };

    print("==================================================> url $url");

    try {
      final response = await http.get(Uri.parse(url), headers: header ?? mainHeader).timeout(const Duration(seconds: timeOut));
      responseJson = handleResponse(response);
    } on SocketException {
      //Get.toNamed(AppRoute.noInternet);
      return ApiResponseModel(503, "No internet connection".tr, '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request".tr, '');
    } on TimeoutException {
      return ApiResponseModel(408, "Request Time Out".tr, "");
    }
    return responseJson;
  }

  ///<<<======================== Put Api ==============================>>>

  static Future<ApiResponseModel> putApi(String url, Map<String, String> body, {Map<String, String>? header}) async {
    dynamic responseJson;

    Map<String, String> mainHeader = {
      'Authorization': PrefsHelper.token,
    };

    try {
      final response = await http.put(Uri.parse(url), body: body, headers: header ?? mainHeader).timeout(const Duration(seconds: timeOut));
      responseJson = handleResponse(response);
    } on SocketException {
   //   Get.toNamed(AppRoute.noInternet);
      return ApiResponseModel(503, "No internet connection".tr, '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request".tr, '');
    } on TimeoutException {
      return ApiResponseModel(408, "Request Time Out".tr, "");
    }
    return responseJson;
  }

  ///<<<======================== Patch Api ==============================>>>

  static Future<ApiResponseModel> patchApi(
      String url, {body, Map<String, String>? header,}) async {
    dynamic responseJson;

    Map<String, String> mainHeader = {
      'Authorization': PrefsHelper.token,
    };

    try {
      if (body != null) {
        final response = await http.patch(Uri.parse(url), body: body, headers: header ?? mainHeader).timeout(const Duration(seconds: timeOut));
        responseJson = handleResponse(response);
      } else {
        final response = await http.patch(Uri.parse(url), headers: header ?? mainHeader).timeout(const Duration(seconds: timeOut));
        responseJson = handleResponse(response);
      }
    } on SocketException {
     // Get.toNamed(AppRoute.noInternet);
      return ApiResponseModel(503, "No internet connection".tr, '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request".tr, '');
    } on TimeoutException {
      return ApiResponseModel(408, "Request Time Out".tr, "");
    }

    return responseJson;
  }

  ///<<<======================== Delete Api ==============================>>>

  static Future<ApiResponseModel> deleteApi(String url, {Map<String, String>? body, Map<String, String>? header}) async {
    dynamic responseJson;

    Map<String, String> mainHeader = {
      'Authorization': PrefsHelper.token,
    };

    try {
      if (body != null) {
        final response = await http.delete(Uri.parse(url), body: body, headers: header ?? mainHeader).timeout(const Duration(seconds: timeOut));
        responseJson = handleResponse(response);
      } else {
        final response = await http
            .delete(Uri.parse(url), headers: header ?? mainHeader)
            .timeout(const Duration(seconds: timeOut));
        responseJson = handleResponse(response);
      }

      ;
    } on SocketException {
  //    Get.toNamed(AppRoute.noInternet);
      return ApiResponseModel(503, "No internet connection".tr, '');
    } on FormatException {
      return ApiResponseModel(400, "Bad response request".tr, '');
    } on TimeoutException {
      return ApiResponseModel(408, "Request time out".tr, "");
    }
    return responseJson;
  }

  ///<<<======================= Multipart Request ============================>>>

  static Future<ApiResponseModel> multipartRequest({
    required String url,
    method = "POST",
    File? imagePath,
    String imageFieldName = "profileImage",
    required Map<String, String> body,
    Map<String, String>? header,
  }) async {
    try {
      var request = http.MultipartRequest(method, Uri.parse(url));

      body.forEach((key, value) {
        request.fields[key] = value;
      });

      if (imagePath != null) {
        var mimeType = lookupMimeType(imagePath.path);
        var img = await http.MultipartFile.fromPath(imageFieldName, imagePath.path, contentType: MediaType.parse(mimeType!));
        request.files.add(img);
      }

      Map<String, String> mainHeader = {
        'Authorization': PrefsHelper.token,
        'Accept-Language': PrefsHelper.localizationLanguageCode
      };

      Map<String, String> headers = header ?? mainHeader;

      headers.forEach((key, value) {
        request.headers[key] = value;
      });

      var response = await request.send();

      if (response.statusCode == 200) {
        String data = await response.stream.bytesToString();
        return ApiResponseModel(200, jsonDecode(data)['message'], data);
      } else {
        String data = await response.stream.bytesToString();
        return ApiResponseModel(
            response.statusCode, jsonDecode(data)['message'], data);
      }
    } on SocketException {
      //Get.toNamed(AppRoute.noInternet);
      return ApiResponseModel(503, "No internet connection".tr, '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request".tr, '');
    } on TimeoutException {
      return ApiResponseModel(408, "Request Time Out".tr, "");
    }
  }


  ///<<<================== Api Response Status Code Handle ====================>>>

  static dynamic handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return ApiResponseModel(response.statusCode,
            jsonDecode(response.body)['message'], response.body);
      case 201:
        return ApiResponseModel(
            200, jsonDecode(response.body)['message'], response.body);
      case 403:
      //  Get.offAllNamed(AppRoute.signin);
        return ApiResponseModel(response.statusCode,
            jsonDecode(response.body)['message'], response.body);
      case 400:
      // Get.offAllNamed(AppRoute.logIn);
        return ApiResponseModel(response.statusCode,
            jsonDecode(response.body)['message'], response.body);
      case 404:
      // Get.offAllNamed(AppRoute.logIn);
        return ApiResponseModel(response.statusCode,
            jsonDecode(response.body)['message'], response.body);
      case 409:
      // Get.offAllNamed(AppRoute.logIn);
        return ApiResponseModel(response.statusCode,
            jsonDecode(response.body)['message'], response.body);

      default:
        print(response.statusCode);
        return ApiResponseModel(response.statusCode,
            jsonDecode(response.body)['message'], response.body);
    }
  }
}

