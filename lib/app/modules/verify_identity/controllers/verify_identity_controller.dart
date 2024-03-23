import 'package:get/get.dart';

import '../../../config/routes/app_pages.dart';

class VerifyIdentityController extends GetxController {
   final int baseDuration = 650;
  void navigateToNewPasswordView() {
    Get.toNamed(Routes.resetPassword);
  }
}
