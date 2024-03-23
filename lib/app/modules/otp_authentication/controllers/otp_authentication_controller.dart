import 'package:flutter/material.dart';

import '../../../components/custom_snack_bar.dart';
import '../../../config/routes/app_pages.dart';
import '../../../utils/helpers/local_storage.dart';
import '../../../utils/services/dio/authentication_services/get_email_token_service.dart';
import '../../sign_up/models/get_email_token_success_response_model.dart';
import '../mixins/number_key_pad_mixin.dart';
import 'package:get/get.dart';

class OTPAuthenticationController extends GetxController
    with
        NumberKeyPadMixin,
        GetTickerProviderStateMixin {
   final int baseDuration = 650;
  final GetEmailTokenService emailTokenService = GetEmailTokenService();

  late Rx<AnimationController> animationController =
      AnimationController(vsync: this).obs;

  void startTimer() {
    animationController.value = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 120,
      ),
    );
    animationController.value.forward();
    update();
  }

  void stopTimer() {
    animationController.value = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 0,
      ),
    );
    animationController.value.forward();
    update();
  }

  void goBack() {
    Get.back();
    stopTimer();
  }

  Future<void> resendEmailToken() async {
    try {
      var res = await emailTokenService.getEmailTokenService(
          email: LocalStorage.getUserEmail());
      if (res.statusCode == 200) {
        // Save response from getEmailTokenService
        GetEmailTokenSuccessResponseModel responseModel =
            GetEmailTokenSuccessResponseModel.fromJson(res.data);

        // Re-assign new token
        otpCode.text = responseModel.data!.token!;
      } else {
        CustomSnackBar.showSnackBar(message: res.data["message"].toString());
        isLoading.value = false;
      }
    } catch (e) {
      CustomSnackBar.showSnackBar(message: e.toString());
      isLoading.value = false;
    }
  }

  Future<void> verifyEmailToken() async {
    if (isOTPValidated.value) {
      isLoading.value = true;
      try {
        var res = await verifyTokenService.verifyEmailTokenService(
          email: LocalStorage.getUserEmail(),
          token: otpCode.text,
        );
        if (res.statusCode == 200) {
          // Navigate to update User's profile screen
          Get.toNamed(Routes.updateProfile);

          // Stop button loader
          isLoading.value = false;
        } else {
          CustomSnackBar.showSnackBar(
              message: res.data["errors"]['token'][0].toString());
          isLoading.value = false;
        }
      } catch (e) {
        CustomSnackBar.showSnackBar(message: e.toString());
        isLoading.value = false;
      }
    }
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override
  void dispose() {
    animationController.value.dispose();
    super.dispose();
  }
}
