import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin ValidateNewPasswordForm {
  final TextEditingController newPassword = TextEditingController(),
      confirmPassword = TextEditingController();

  Rx<bool> isNewPasswordValidated = false.obs,
      isConfirmPasswordValidated = false.obs,
      isLoading = false.obs;

  Rx<Color> buttonColor =
      Theme.of(Get.context!).primaryColor.withOpacity(.45).obs;

  bool passwordIsStrong(String password) =>
      passwordStates(password).every((element) => element == true);

  bool matchRegex({required String pattern, required String password}) =>
      RegExp(pattern).hasMatch(password);

  List<bool> passwordStates(String password) {
    return [
      matchRegex(pattern: r'[A-Z]', password: password), // has upper case
      matchRegex(pattern: r'[a-z]', password: password), // has lower case
      matchRegex(pattern: r'[!@#\$&*~,.;:]', password: password), // has symbol
      matchRegex(pattern: r'[0-9]', password: password), // has number
      matchRegex(
          pattern: r'.{8,}', password: password), // is at least 8 chars long
    ];
  }

  void validateNewPassword() => !passwordIsStrong(newPassword.text)
      ? isNewPasswordValidated.value = false
      : {
          isNewPasswordValidated.value = true,
          activateButton(),
        };

  void validateConfirmPassword() => newPassword.text != confirmPassword.text
      ? isConfirmPasswordValidated.value = false
      : {
    isConfirmPasswordValidated.value = true,
          activateButton(),
        };

  void activateButton() => isNewPasswordValidated.value == true &&
          isConfirmPasswordValidated.value == true
      ? buttonColor.value = Theme.of(Get.context!).primaryColor
      : buttonColor.value =
          Theme.of(Get.context!).primaryColor.withOpacity(.45);
}
