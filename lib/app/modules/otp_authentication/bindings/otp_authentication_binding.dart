import 'package:get/get.dart';

import '../controllers/otp_authentication_controller.dart';

class OTPAuthenticationBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<OTPAuthenticationController>(() => OTPAuthenticationController());
  }
}
