import 'package:get/get.dart';

import '../../../config/routes/app_pages.dart';
import '../../../utils/helpers/local_storage.dart';
import '../../update_profile/models/sign_up_success_response_model.dart';
import '../mixins/create_pin_number_key_pad_mixin.dart';

class CreatePinController extends GetxController
    with CreatePinNumberKeyPadMixin
{
   final int baseDuration = 650;
  void savePIN({required SignUpSuccessResponseModel userData}) {
    if (isPinValidated.value) {
      isLoading.value = true;
      Future.delayed(const Duration(milliseconds: 1000), () {
        isLoading.value = false;
        LocalStorage.savePINCode(pinCode.text);
        Get.offAllNamed(Routes.confirmation, arguments: [userData]);
      });
    }
  }
}
