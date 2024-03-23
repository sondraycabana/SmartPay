import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/services/dio/authentication_services/verify_email_token_service.dart';

mixin CreatePinNumberKeyPadMixin {
  final TextEditingController pinCode = TextEditingController();
  final VerifyEmailTokenService verifyTokenService = VerifyEmailTokenService();
  Rx<bool> isPinValidated = false.obs, isLoading = false.obs;
  Rx<Color> buttonColor = Theme.of(Get.context!).primaryColor.withOpacity(.45).obs;

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
    if (pinCode.text.length < 5) {
      pinCode.text += value;
    }
  }

  void on0KeyPressed(int i) {
    if (pinCode.text.length < 5) {
      pinCode.text += '0';
    }
  }

  void onDeleteKeyPressed() {
    if (pinCode.text.isNotEmpty) {
      int length = pinCode.text.length;
      int end = pinCode.text.substring(length - 1, length - 1) == '.' ? 1 : 1;
      pinCode.text = pinCode.text.substring(0, length - end);
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
    if (pinCode.text.length < 5) {
      isPinValidated.value = false;
      buttonColor.value = Theme.of(Get.context!).primaryColor.withOpacity(.45);
    } else {
      isPinValidated.value = true;
      buttonColor.value = Theme.of(Get.context!).primaryColor;
    }
  }
}
