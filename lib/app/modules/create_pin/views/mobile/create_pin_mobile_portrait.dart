import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:smartpay/app/modules/create_pin/views/widgets/create_pin_input_field.dart';
import '../../../../components/custom_icon_back_button.dart';
import '../../../../components/custom_text_button.dart';
import '../../../../constants/space_widgets.dart';
import '../../../../utils/ui/animations/slide_in_animation.dart';
import '../../../sign_in/views/widgets/body_subtitle_text.dart';
import '../../../sign_in/views/widgets/headline_title_text.dart';
import '../../../update_profile/models/sign_up_success_response_model.dart';
import '../../controllers/create_pin_controller.dart';
import '../widgets/create_pin_enter_digits.dart';
import '../widgets/create_pin_input_field.dart';

class CreatePinMobilePortrait extends GetView<CreatePinController> {
  CreatePinMobilePortrait({super.key});

  final SignUpSuccessResponseModel userData = Get.arguments[0];

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
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24.0, top: 12),
                      child: BackIconButton(),
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
                            durationInMilliseconds:
                            controller.baseDuration ,
                            child: const HeadlineTitleText(
                              primaryText: "Set your PIN code",
                            ),
                          ),
                          SlideInAnimation(
                            direction: pi * .25,
                            durationInMilliseconds:
                            controller.baseDuration + 25,
                            child: const BodySubTitleText(
                              primaryText:
                                  'We use state-of-the-art security measures to protect your information at all times',
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
                      durationInMilliseconds:
                      controller.baseDuration + 50,

                      child: CreatePinInputField(
                        key: key,
                        length: 5,
                        onChanged: (_) => controller.validateOTPCode(),
                        pinController: controller.pinCode,
                        onCompleted: (val) {},
                      ),
                    ),
                    const VerticalSpace(32),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SlideInAnimation(
                  direction: pi * .25,
                  durationInMilliseconds:
                  controller.baseDuration + 75,
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
                            onPressed: () => controller.savePIN(userData: userData),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(28),
                SlideInAnimation(
                  direction: pi * .25,
                  durationInMilliseconds:
                  controller.baseDuration + 100,
                  child: CreatePinNumberGrid(
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
