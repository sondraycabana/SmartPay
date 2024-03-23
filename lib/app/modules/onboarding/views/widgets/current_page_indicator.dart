import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../controllers/onboarding_controller.dart';

class CurrentPageIndicator extends GetView<OnboardingController> {
  const CurrentPageIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: Get.height >= 799 ? 6 : 6,
              width: Get.height >= 799 &&
                      controller.color1.value == AppColors.primaryColor
                  ? 32
                  : Get.height >= 799
                      ? 6
                      : 6,
              decoration: BoxDecoration(
                color: controller.color1.value,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: Get.height >= 799 ? 6 : 6,
              width: Get.height >= 799 &&
                      controller.color2.value == AppColors.primaryColor
                  ? 32
                  : Get.height >= 799
                      ? 6
                      : 6,
              decoration: BoxDecoration(
                color: controller.color2.value,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
