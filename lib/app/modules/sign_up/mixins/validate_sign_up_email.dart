import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin ValidateEmail {
  final TextEditingController email = TextEditingController();
  Rx<bool> isEmailValidated = false.obs, isLoading = false.obs;
  Rx<Color> buttonColor =
      Theme.of(Get.context!).primaryColor.withOpacity(.45).obs;

  void validateEmail() {
    if (!GetUtils.isEmail(email.text)) {
      isEmailValidated.value = false;
      buttonColor.value = Theme.of(Get.context!).primaryColor.withOpacity(.45);
    } else {
      isEmailValidated.value = true;
      buttonColor.value = Theme.of(Get.context!).primaryColor;
    }
  }
}
