import '../../../constants/smart_pay_meta_data.dart';
import '../controllers/splash_base_controller.dart';

mixin InitMetaDataMixin on SplashBaseController {
  void initMetaData() {
    isFirstLaunch = box.read<bool>(SmartPayMetaData.isFirstLaunch) ?? true;
    isLoggedIn = box.read(SmartPayMetaData.isLoggedIn) ?? false;
  }
}
