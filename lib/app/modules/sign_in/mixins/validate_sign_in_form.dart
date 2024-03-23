import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin ValidateSignInForm {
  final TextEditingController email = TextEditingController(),
      password = TextEditingController();

  Rx<bool> isEmailValidated = false.obs,
      isPasswordValidated = false.obs,
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

  void validateEmail() => !GetUtils.isEmail(email.text)
      ? isEmailValidated.value = false
      : {
          isEmailValidated.value = true,
          activateButton(),
        };

  void validatePassword() => !passwordIsStrong(password.text)
      ? isPasswordValidated.value = false
      : {
          isPasswordValidated.value = true,
          activateButton(),
        };

  void activateButton() =>
      isEmailValidated.value == true && isPasswordValidated.value == true
          ? buttonColor.value = Theme.of(Get.context!).primaryColor
          : Theme.of(Get.context!).primaryColor.withOpacity(.45);
}
