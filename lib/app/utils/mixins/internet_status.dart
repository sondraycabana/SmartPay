import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetStatus {
  late final StreamSubscription<InternetConnectionStatus> _listener;
  bool firstCheck = true;

  void showInternetStatus(bool online) {
    BotToast.showCustomNotification(
        enableSlideOff: false,
        toastBuilder: (cancelFunc) {
          Future.delayed(
              const Duration(
                seconds: 5,
              ),
              () => online ? cancelFunc() : null);
          return Container(
            width: Get.width,
            height: 17,
            color: online ? Colors.green : Colors.black,
            child: Center(
              child: Text(
                online ? 'Connected' : 'No internet connection',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
        duration: const Duration(days: 1),
        align: Alignment.topCenter,
        dismissDirections: []);
  }

  void listenToInternetStatus() {
    _listener =
        InternetConnectionChecker().onStatusChange.listen(onStatusChanged);
  }

  void onStatusChanged(status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        if (!firstCheck) showInternetStatus(true);
        break;
      case InternetConnectionStatus.disconnected:
        firstCheck = false;
        showInternetStatus(false);
        break;
    }
  }

  void disposeInternetListener() {
    print('internet status listener is disposed');
    _listener.cancel();
  }
}
