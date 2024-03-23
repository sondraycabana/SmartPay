import 'package:get/get.dart';
import '../../../config/routes/app_pages.dart';
import '../mixins/validate_new_password_form.dart';

class ResetPasswordController extends GetxController
    with ValidateNewPasswordForm {
   final int baseDuration = 650;
  void navigateToSignInView() {
    if (isNewPasswordValidated.value == true &&
        isConfirmPasswordValidated.value == true) {
      isLoading.value = true;
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.offAllNamed(Routes.signIn);
        isLoading.value = false;
      });
    }
  }
}
