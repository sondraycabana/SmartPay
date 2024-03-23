import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/services/dio/authentication_services/verify_email_token_service.dart';


mixin NumberKeyPadMixin {
  final TextEditingController otpCode = TextEditingController();
  final VerifyEmailTokenService verifyTokenService = VerifyEmailTokenService();
  Rx<bool> isOTPValidated = true.obs, isLoading = false.obs;
  Rx<Color> buttonColor = Theme.of(Get.context!).primaryColor.obs;

  void buttonFunction(int i) {
    switch (i) {
      case 9:
        break;
      case 10:
        on0KeyPressed(i);
        break;
      case 11:
        onDeleteKeyPressed();
        break;
      default:
        on1To9KeyPressed(i);
    }
  }

  void on1To9KeyPressed(int i) {
    String value = '${i + 1}';
    if (otpCode.text.length < 5) {
      otpCode.text += value;
    }
  }

  void on0KeyPressed(int i) {
    if (otpCode.text.length < 5) {
      otpCode.text += '0';
    }
  }

  void onDeleteKeyPressed() {
    if (otpCode.text.isNotEmpty) {
      int length = otpCode.text.length;
      int end = otpCode.text.substring(length - 1, length - 1) == '.' ? 1 : 1;
      otpCode.text = otpCode.text.substring(0, length - end);
    }
  }

  String buttonText(int i) {
    switch (i) {
      case 9:
        return '*';
      case 10:
        return '0';
      case 11:
        return '⌫';
      default:
        return '${i + 1}';
    }
  }

  void validateOTPCode() {
    if (otpCode.text.length < 5) {
      isOTPValidated.value = false;
      buttonColor.value = Theme.of(Get.context!).primaryColor.withOpacity(.45);
    } else {
      isOTPValidated.value = true;
      buttonColor.value = Theme.of(Get.context!).primaryColor;
    }
  }
}
