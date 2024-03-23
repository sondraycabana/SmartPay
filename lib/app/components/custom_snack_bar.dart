import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static showSnackBar({message, color}) {
    return BotToast.showCustomNotification(
      dismissDirections: const [
        DismissDirection.vertical,
        DismissDirection.down
      ],
      duration: const Duration(milliseconds: 2000),
      enableSlideOff: true,
      crossPage: true,
      onlyOne: true,
      enableKeyboardSafeArea: false,
      toastBuilder: (void Function() cancelFunc) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color ?? Colors.red.shade400,
          ),
          height: 40,
          // width: Get.width,
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              height: 2.2,
              fontWeight: FontWeight.w600,
              letterSpacing: .2,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
