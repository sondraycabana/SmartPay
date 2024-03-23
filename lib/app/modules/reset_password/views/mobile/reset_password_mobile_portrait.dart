import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/custom_icon_back_button.dart';
import '../../../../components/custom_text_button.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../constants/space_widgets.dart';
import '../../../../utils/ui/animations/slide_in_animation.dart';
import '../../../sign_in/views/widgets/body_subtitle_text.dart';
import '../../../sign_in/views/widgets/headline_title_text.dart';
import '../../controllers/reset_password_controller.dart';

class ResetPasswordMobilePortrait extends GetView<ResetPasswordController> {
  const ResetPasswordMobilePortrait({super.key});

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
                        durationInMilliseconds: controller.baseDuration,
                        child: const HeadlineTitleText(
                          primaryText: "Create New Password",
                        ),
                      ),
                      SlideInAnimation(
                        direction: pi * .25,
                        durationInMilliseconds: controller.baseDuration + 25,
                        child: const BodySubTitleText(
                          primaryText:
                              'Please, enter a new password below different from the previous password',
                        ),
                      ),
                      SlideInAnimation(
                        direction: pi * .25,
                        durationInMilliseconds: controller.baseDuration + 50,
                        child: CustomTextField(
                          isPasswordField: true,
                          controller: controller.newPassword,
                          hintText: 'New password',
                          onChanged: (_) => controller.validateNewPassword(),
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                        ),
                      ),
                      const VerticalSpace(16),
                      SlideInAnimation(
                        direction: pi * .25,
                        durationInMilliseconds: controller.baseDuration + 75,
                        child: CustomTextField(
                          isPasswordField: true,
                          controller: controller.confirmPassword,
                          hintText: 'Confirm password',
                          onChanged: (_) => controller.validateConfirmPassword(),
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                        ),
                      ),
                      const VerticalSpace(32),
                    ],
                  ),
                ),
              ],
            ),
            Obx(
              () =>  SlideInAnimation(
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
                        buttonText: 'Create new password',
                        onPressed: () => controller.navigateToSignInView(),
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
