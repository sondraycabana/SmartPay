import 'package:get/get.dart';

import '../../../config/routes/app_pages.dart';
import '../../../constants/smart_pay_meta_data.dart';
import '../../../utils/helpers/local_storage.dart';
import '../controllers/splash_base_controller.dart';

mixin NextPageMixin on SplashBaseController {
  void moveToNextPage() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    if (isFirstLaunch) {
      box.write(SmartPayMetaData.isFirstLaunch, false);
      return Get.offAndToNamed(Routes.onboarding);
    }
    if (LocalStorage.getToken() != "" && LocalStorage.getFullName() != null) {
      box.write(SmartPayMetaData.isLoggedIn, true);
      return Get.offAndToNamed(Routes.enterPin);
    }

    // if (isLoggedIn) return Get.offAndToNamed(Routes.signIn);
    return Get.offAndToNamed(Routes.signIn);
  }
}
