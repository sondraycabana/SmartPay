import '../../../utils/mixins/internet_status.dart';
import '../mixins/init_meta_data_mixin.dart';
import '../mixins/next_page_mixin.dart';
import '../mixins/splash_animation_mixin.dart';
import 'splash_base_controller.dart';

class SplashController extends SplashBaseController
    with SplashAnimationMixin, InitMetaDataMixin, NextPageMixin {
  @override
  void onInit() {
    initMetaData();
    runAnimation();
    moveToNextPage();
    var internetStatus = InternetStatus();
    internetStatus.listenToInternetStatus();
    super.onInit();
  }

  @override
  void onClose() {
    opacityCtrl.dispose();
  }
}
