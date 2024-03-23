import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding_controller.dart';

class OnboardingImage extends GetView<OnboardingController> {
  const OnboardingImage(this.image, {super.key});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: FadeTransition(
        opacity: controller.opacityAnimation,
        child: SlideTransition(
          position: controller.slideDownPosition,
          child: SizedBox(
            width: Get.width,
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }
}
