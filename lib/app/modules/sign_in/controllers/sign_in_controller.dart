import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';

import '../../../components/custom_snack_bar.dart';
import '../../../config/routes/app_pages.dart';
import '../../../utils/helpers/local_storage.dart';
import '../../../utils/services/dio/authentication_services/sign_in_service.dart';
import '../mixins/validate_sign_in_form.dart';
import '../models/sign_in_success_response_model.dart';

class SignInController extends GetxController with ValidateSignInForm {
  final SignInService signInService = SignInService();
   final int baseDuration = 650;

  void navigateToPasswordRecoveryView() {
    Get.toNamed(Routes.passwordRecovery);
  }

  Future<void> signIn() async {
    if (isEmailValidated.value && isPasswordValidated.value) {
      isLoading.value = true;
      try {
        var res = await signInService.signInService(
          email: email.text,
          password: password.text,
          deviceName: "mobile",
        );

        if (res.statusCode == 200) {
          // Save response from signInService
          SignInSuccessResponseModel responseData =
              SignInSuccessResponseModel.fromJson(res.data);

          // Save access token in Local Storage
          LocalStorage.saveToken(responseData.data.token);

          // Save User's full name in Local Storage
          LocalStorage.saveFullName(responseData.data.user.fullName);

          // Navigate to Confirmation screen
          Get.toNamed(Routes.home);

          // Stop button loader
          isLoading.value = false;
        } else {
          CustomSnackBar.showSnackBar(message: res.data["errors"]['email'][0].toString());
          isLoading.value = false;
        }
      } catch (e) {
        CustomSnackBar.showSnackBar(message: e.toString());
        isLoading.value = false;
      }
    }
  }
}
