import 'package:get/get.dart';

const smallWidth = 1;
const smallToMediumWidth = 1;
const mediumWidth = 1;
const mediumToLargeWidth = 1;
const largeWidth = 1;

const smallHeight = 1;
const smallToMediumHeight = 1;
const mediumHeight = 1;
const mediumToLargeHeight = 1;
const largeHeight = 1;

T resH<T>({T? s, T? sm, T? m, T? ml, T? l}) {
  if (Get.height >= 853) return s!;
  if (Get.height >= 567) return s!;
  if (Get.height >= 732) return s!;
  if (Get.height >= 567) return s!;
  if (Get.height >= 640) return s!;

  return s!;
}

T resW<T>({T? s, T? sm, T? m, T? ml, T? l}) {
 if (Get.width >= 853) return s!;
  if (Get.width >= 567) return s!;
  if (Get.width >= 732) return s!;
  if (Get.width >= 567) return s!;
  if (Get.width >= 640) return s!;

  return s!;
}
