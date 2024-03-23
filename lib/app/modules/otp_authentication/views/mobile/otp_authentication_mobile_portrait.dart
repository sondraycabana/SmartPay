import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/custom_icon_back_button.dart';
import '../../../../components/custom_text_button.dart';
import '../../../../constants/space_widgets.dart';
import '../../../../utils/ui/animations/slide_in_animation.dart';
import '../../../sign_in/views/widgets/body_subtitle_text.dart';
import '../../../sign_in/views/widgets/headline_title_text.dart';
import '../../controllers/otp_authentication_controller.dart';
import '../widgets/countdown.dart';
import '../widgets/enter_digits.dart';
import '../widgets/otp_authentication_input_field.dart';

class OTPAuthenticationMobilePortrait
    extends GetView<OTPAuthenticationController> {
  OTPAuthenticationMobilePortrait({super.key});

  final List arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.startTimer();
    controller.otpCode.text = arguments[1];
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
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 12),
                      child: BackIconButton(
                        onPressed: () => controller.goBack(),
                      ),
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
                            durationInMilliseconds: controller.baseDuration,
                            child: const HeadlineTitleText(
                              primaryText: "Verify it’s you",
                            ),
                          ),
                          SlideInAnimation(
                            direction: pi * .25,
                            durationInMilliseconds:
                                controller.baseDuration + 25,
                            child: BodySubTitleText(
                              primaryText: 'We send a code to ',
                              boldText: arguments[0],
                              subPrimaryText:
                                  ". Enter it here to verify your identity",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SlideInAnimation(
                      direction: pi * .25,
                      durationInMilliseconds: controller.baseDuration + 50,
                      child: OTPAuthenticationInputField(
                        key: key,
                        length: 5,
                        onChanged: (_) => controller.validateOTPCode(),
                        pinController: controller.otpCode,
                        onCompleted: (val) {},
                      ),
                    ),
                    const VerticalSpace(32),
                    Obx(
                      () => SlideInAnimation(
                        direction: pi * .25,
                        durationInMilliseconds: controller.baseDuration + 75,
                        child: Countdown(
                          onPressed: () {
                            controller.resendEmailToken();
                            controller.startTimer();
                          },
                          animation: StepTween(
                            begin: 120,
                            end: 0,
                          ).animate(controller.animationController.value),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SlideInAnimation(
                  direction: pi * .25,
                  durationInMilliseconds: controller.baseDuration + 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Obx(
                      () => Flex(
                        direction: Axis.horizontal,
                        children: [
                          CustomTextButton(
                            isLoading: controller.isLoading.value,
                            buttonColor: controller.buttonColor.value,
                            buttonText: 'Confirm',
                            onPressed: () => controller.verifyEmailToken(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(28),
                SlideInAnimation(
                  direction: pi * .25,
                  durationInMilliseconds: controller.baseDuration + 125,
                  child: NumberGrid(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
