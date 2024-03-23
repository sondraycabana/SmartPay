import 'package:get/get.dart';

mixin ResponsiveMixin {
  double imageHeight() {
    final height = Get.height; //640;
    if (height >= 853) return height * .60;
    if (height >= 732) return height * .40;
    if (height >= 640) return height * .29;
    return .23;
  }
}
