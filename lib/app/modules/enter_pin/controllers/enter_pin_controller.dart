import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_snack_bar.dart';
import '../../../config/routes/app_pages.dart';
import '../../../utils/helpers/local_storage.dart';
import '../../../utils/services/dio/authentication_services/log_out_service.dart';
import '../mixins/enter_pin_number_key_pad_mixin.dart';

class EnterPinController extends GetxController
    with EnterPinNumberKeyPadMixin
{
   final int baseDuration = 650;
  final LogOutService logOutService = LogOutService();

  void validateOTPCode() {
    if (pinCode.text.length < 5) {
      isPinValidated.value = false;
    } else {
      isPinValidated.value = true;
      checkPIN();
    }
  }

  void checkPIN() {
    if (isPinValidated.value) {
      isLoading.value = true;
      Future.delayed(const Duration(milliseconds: 2000), () {
        if (LocalStorage.getPINCode() == pinCode.text) {
          Get.offAllNamed(Routes.home);
          isLoading.value = false;
        } else {
          pinCode.text = "";
          CustomSnackBar.showSnackBar(message: "Incorrect PIN".toString());
          isLoading.value = false;
        }
      });
    }
  }

  Future<void> logOut() async {
    try {
      var res = await logOutService.logOutService();
      if (res.statusCode == 200) {
        LocalStorage.saveToken('');
        Get.offAndToNamed(Routes.signIn);
      } else {
        CustomSnackBar.showSnackBar(message: res.data["message"].toString());
      }
    } catch (e) {
      CustomSnackBar.showSnackBar(message: e.toString());
    }
  }
}
