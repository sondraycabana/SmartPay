import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../components/custom_text_button.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../constants/asset_paths.dart';
import '../../../../constants/space_widgets.dart';
import '../../../../utils/ui/animations/slide_in_animation.dart';
import '../../../sign_in/views/widgets/body_subtitle_text.dart';
import '../../../sign_in/views/widgets/headline_title_text.dart';
import '../../controllers/password_recovery_controller.dart';

class PasswordRecoveryMobilePortrait
    extends GetView<PasswordRecoveryController> {
  const PasswordRecoveryMobilePortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 12),
                  child: SlideInAnimation(
                      direction: pi * .25,
                      durationInMilliseconds: controller.baseDuration,
                      child: SvgPicture.asset(AssetPath.lockIcon)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32.0,
                    left: 24.0,
                    right: 24.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SlideInAnimation(
                        direction: pi * .25,
                        durationInMilliseconds: controller.baseDuration+ 25,
                        child: const HeadlineTitleText(
                          primaryText: "Password Recovery",
                        ),
                      ),
                      SlideInAnimation(
                        direction: pi * .25,
                        durationInMilliseconds: controller.baseDuration + 50,
                        child: const BodySubTitleText(
                          primaryText:
                              'Enter your registered email below to receive password instructions',
                        ),
                      ),
                      SlideInAnimation(
                        direction: pi * .25,
                        durationInMilliseconds: controller.baseDuration + 75,
                        child: CustomTextField(
                          controller: controller.email,
                          hintText: 'Email',
                          onChanged: (_) => controller.validateEmail(),
                        ),
                      ),
                      const VerticalSpace(32),
                    ],
                  ),
                ),
              ],
            ),
            Obx(
              () => SlideInAnimation(
                direction: pi * .25,
                durationInMilliseconds: controller.baseDuration + 100,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40.0,
                    left: 24.0,
                    right: 24.0,
                  ),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      CustomTextButton(
                        isLoading: controller.isLoading.value,
                        buttonColor: controller.buttonColor.value,
                        buttonText: 'Send me email',
                        onPressed: () =>
                            controller.navigateToVerifyIdentityView(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
