import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin ValidateRegisterForm {
  final TextEditingController fullName = TextEditingController(),
      userName = TextEditingController(),
      country = TextEditingController(),
      password = TextEditingController();

  Rx<bool> isFullNameValidated = false.obs,
      isCountryValidated = false.obs,
      isPasswordValidated = false.obs,
      isLoading = false.obs,
      showPasswordInfo = false.obs;
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

  void validateFullName() => fullName.text.length < 2
      ? isFullNameValidated.value = false
      : {
          isFullNameValidated.value = true,
          activateButton(),
        };

  void validateCountry() => country.text.isEmpty
      ? isCountryValidated.value = false
      : {
          isCountryValidated.value = true,
          activateButton(),
        };

  void validatePassword() => !passwordIsStrong(password.text)
      ? {
          isPasswordValidated.value = false,
          showPasswordInfo.value = true,
        }
      : {
          isPasswordValidated.value = true,
          showPasswordInfo.value = false,
          activateButton(),
        };

  void activateButton() => isFullNameValidated.value == true &&
          isPasswordValidated.value == true &&
          isCountryValidated.value == true
      ? buttonColor.value = Theme.of(Get.context!).primaryColor
      : buttonColor.value =
          Theme.of(Get.context!).primaryColor.withOpacity(.45);
}
