import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashBaseController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late bool isFirstLaunch;
  late bool isLoggedIn;

  final box = GetStorage();
}
