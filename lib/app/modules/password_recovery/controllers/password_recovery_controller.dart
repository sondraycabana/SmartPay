import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../config/routes/app_pages.dart';
import '../../../utils/mixins/encrypt_email_string.dart';

class PasswordRecoveryController extends GetxController
    with EncryptEmailString {
  final TextEditingController email = TextEditingController();
   final int baseDuration = 650;

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

  void navigateToVerifyIdentityView() {
    if (isEmailValidated.value) {
      isLoading.value = true;
      Future.delayed(
        const Duration(milliseconds: 1000),
        () {
          Get.toNamed(
            Routes.verifyIdentity,
            arguments: [
              encryptEmailString(email.text),
            ],
          );
          isLoading.value = false;
        },
      );
    }
  }
}
