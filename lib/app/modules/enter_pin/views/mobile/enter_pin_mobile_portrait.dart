import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/custom_icon_back_button.dart';
import '../../../../components/custom_text_button.dart';
import '../../../../config/routes/app_pages.dart';
import '../../../../constants/space_widgets.dart';
import '../../../../utils/helpers/local_storage.dart';
import '../../../../utils/ui/animations/slide_in_animation.dart';
import '../../../create_pin/views/widgets/create_pin_input_field.dart';
import '../../../sign_in/views/widgets/body_subtitle_text.dart';
import '../../../sign_in/views/widgets/headline_title_text.dart';
import '../../../update_profile/models/sign_up_success_response_model.dart';
import '../../controllers/enter_pin_controller.dart';
import '../widgets/enter_pin_enter_digits.dart';

class EnterPinMobilePortrait extends GetView<EnterPinController> {
  const EnterPinMobilePortrait({super.key});

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
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24.0, top: 12),
                        child: SlideInAnimation(
                          direction: pi * .25,
                          durationInMilliseconds: controller.baseDuration,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => controller.logOut(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                'Sign Out',
                                style: TextStyle(
                                  height: 1.6,
                                  fontSize: 16.5,
                                  letterSpacing: .2,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
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
                            durationInMilliseconds:
                                controller.baseDuration + 25,
                            child: const HeadlineTitleText(
                              primaryText: "Enter your PIN code",
                            ),
                          ),
                          SlideInAnimation(
                            direction: pi * .25,
                            durationInMilliseconds:
                                controller.baseDuration + 50,
                            child: BodySubTitleText(
                              primaryText:
                                  "Welcome Back, ${LocalStorage.getFullName()}",
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
                      durationInMilliseconds: controller.baseDuration + 75,
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
                  durationInMilliseconds: controller.baseDuration + 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Obx(
                      () => Flex(
                        direction: Axis.horizontal,
                        children: [
                          CustomTextButton(
                            isLoading: controller.isLoading.value,
                            buttonColor: Colors.transparent,
                            textColor: Colors.transparent,
                            loadingButtonColor: Colors.transparent,
                            loadingColor: Theme.of(context).primaryColor,
                            buttonText: 'Confirm',
                            onPressed: () => controller.checkPIN(),
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
                  child: EnterPinNumberGrid(
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
