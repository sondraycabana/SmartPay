import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/custom_text_button.dart';
import '../../../../config/routes/app_pages.dart';
import '../../../../constants/asset_paths.dart';
import '../../../../constants/space_widgets.dart';
import '../../../../utils/ui/animations/slide_in_animation.dart';
import '../../../sign_in/views/widgets/body_subtitle_text.dart';
import '../../../sign_in/views/widgets/headline_title_text.dart';
import '../../../update_profile/models/sign_up_success_response_model.dart';
import '../../controllers/confirmation_controller.dart';

class ConfirmationMobilePortrait extends GetView<ConfirmationController> {
  ConfirmationMobilePortrait({super.key});

  final SignUpSuccessResponseModel userData = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideInAnimation(
              direction: pi * .25,
              durationInMilliseconds: controller.baseDuration,
              child: Image.asset(
                AssetPath.thumbsUpIcon,
                width: Get.width * .35,
              ),
            ),
            const VerticalSpace(24),
            SlideInAnimation(
              direction: pi * .25,
              durationInMilliseconds: controller.baseDuration + 25,
              child: HeadlineTitleText(
                  primaryText:
                      "Congratulations, ${userData.data!.user!.fullName!.split(" ")[0]}"),
            ),
            SlideInAnimation(
              direction: pi * .25,
              durationInMilliseconds: controller.baseDuration + 50,
              child: const BodySubTitleText(
                primaryText:
                    'You’ve completed the onboarding,\nyou can start using',
                textAlign: TextAlign.center,
              ),
            ),
            const VerticalSpace(36),
            SlideInAnimation(
              direction: pi * .25,
              durationInMilliseconds: controller.baseDuration + 75,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    CustomTextButton(
                      buttonText: 'Get Started',
                      onPressed: () => Get.offAllNamed(Routes.home),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
