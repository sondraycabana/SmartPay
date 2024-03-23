import 'package:get/get.dart';
import '../../../components/custom_snack_bar.dart';
import '../../../config/routes/app_pages.dart';
import '../../../utils/helpers/local_storage.dart';
import '../../../utils/mixins/encrypt_email_string.dart';
import '../../../utils/services/dio/authentication_services/get_email_token_service.dart';
import '../mixins/validate_sign_up_email.dart';
import '../models/get_email_token_success_response_model.dart';

class SignUpController extends GetxController
    with ValidateEmail, EncryptEmailString {
  final GetEmailTokenService emailTokenService = GetEmailTokenService();
   final int baseDuration = 650;

  Future<void> getEmailToken() async {
    if (isEmailValidated.value) {
      isLoading.value = true;
      try {
        var res =
            await emailTokenService.getEmailTokenService(email: email.text);
        if (res.statusCode == 200) {
          // Save response from getEmailTokenService
          GetEmailTokenSuccessResponseModel responseModel =
              GetEmailTokenSuccessResponseModel.fromJson(res.data);

          // Navigate to verify email token screen
          Get.toNamed(
            Routes.otpAuthentication,
            arguments: [
              encryptEmailString(email.text),
              responseModel.data!.token!
            ],
          );

          // Stop button loader
          isLoading.value = false;

          // Save Email Address in Local Storage
          LocalStorage.saveUserEmail(email.text);
        } else {
          CustomSnackBar.showSnackBar(message: res.data["message"].toString());
          isLoading.value = false;
        }
      } catch (e) {
        CustomSnackBar.showSnackBar(message: e.toString());
        isLoading.value = false;
      }
    }
  }
}
