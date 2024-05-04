import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../global/api_url_container.dart';
import '../global/share_prefes_helper.dart';
import 'notification_service.dart';


class SocketServices {
  static late io.Socket socket;
  bool show = false;

  static NotificationService notificationService = NotificationService();

  ///<<<============ Connect with socket ====================>>>
  static void connectToSocket() {
    socket = io.io(
        ApiUrl.socketUrl,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());

    socket.onConnect((data) {
      debugPrint("=============================> Connection $data");
    });
    socket.onConnectError((data) {
      print("============================>Connection Error $data");
    });

    socket.connect();

    socket.on(PrefsHelper.userId, (data) {
      print("================> get Data on socket: $data");
      print("User ID${PrefsHelper.userId}");

      notificationService.showNotification(data);
    });
    // socket.on('notification_role_base::${PrefsHelper.role}', (data) {
    //   print("================> get Data on socket: $data");
    //   notificationService.showNotification(data);
    // });

    // socket.on('blocked-user::${SharedPreferenceHelper.id}', (data) {
    //   // print("================> get Data on socket: $data");
    //   //
    //   // print(data);
    //   // print(data.runtimeType);
    //
    //   print(data['statusCode'].toString());
    //   print(data['message'].toString());
    //
    //   if (data['statusCode'] == 1000) {
    //     sharedPreferenceHelper.logOut() ;
    //     // Get.offAllNamed(AppRoute.logIn);
    //     Utils.toastMessage(data['message']);
    //   }
    //   // notificationService.showNotification(data);
    // });
  }
}
