import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/onboarding_controller.dart';
import '../body_text.dart';
import '../current_page_indicator.dart';
import '../headline_text.dart';
import '../top_image.dart';

class OnboardingContext extends GetView<OnboardingController> {
  OnboardingContext({Key? key}) : super(key: key);

  final _controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: Get.height * .6,
            child: PageView(
              onPageChanged: (_) {

                controller.updateColor();
              },
              controller: controller.bgPageController,
              children: [
                for (int i = 0; i < controller.onboardingPages.length; i++)
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      OnboardingImage(
                          controller.onboardingPages[i].backgroundImagePath),
                      Padding(
                        padding: const EdgeInsets.only(top: 300.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeadlineText(
                                controller.onboardingPages[i].headline),
                            BodyText(controller.onboardingPages[i].body),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        const CurrentPageIndicator(),
      ],
    );
  }
}
