import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/custom_icon_back_button.dart';
import '../../../../components/custom_icon_button.dart';
import '../../../../components/custom_text_button.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../config/routes/app_pages.dart';
import '../../../../constants/asset_paths.dart';
import '../../../../constants/space_widgets.dart';
import '../../../../utils/ui/animations/slide_in_animation.dart';
import '../../../sign_in/views/widgets/headline_title_text.dart';
import '../../controllers/sign_up_controller.dart';

class SignUpMobilePortrait extends GetView<SignUpController> {
  const SignUpMobilePortrait({super.key});

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
                  child: BackIconButton(
                    onPressed: () {},
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
                          primaryText: "Create a ",
                          accentText: "Smartpay\n",
                          subPrimaryText: "account",
                        ),
                      ),
                      const VerticalSpace(32),
                      SlideInAnimation(
                        direction: pi * .25,
                        durationInMilliseconds: controller.baseDuration + 25,
                        child: CustomTextField(
                          controller: controller.email,
                          hintText: 'Email',
                          onChanged: (_) => controller.validateEmail(),
                        ),
                      ),
                      const VerticalSpace(24),
                      Obx(
                        () => SlideInAnimation(
                          direction: pi * .25,
                          durationInMilliseconds: controller.baseDuration + 50,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              CustomTextButton(
                                isLoading: controller.isLoading.value,
                                buttonColor: controller.buttonColor.value,
                                buttonText: 'Sign Up',
                                onPressed: () => controller.getEmailToken(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSpace(32),
                      SlideInAnimation(
                        direction: pi * .25,
                        durationInMilliseconds: controller.baseDuration + 75,
                        child: Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                endIndent: 12.0,
                              ),
                            ),
                            Text(
                              "OR",
                              style: TextStyle(
                                height: 1.35,
                                fontSize: 14,
                                letterSpacing: .1,
                                fontWeight: FontWeight.w200,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                indent: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalSpace(28),
                      SlideInAnimation(
                        direction: pi * .25,
                        durationInMilliseconds: controller.baseDuration + 100,
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            CustomIconButton(
                              icon: AssetPath.googleIcon,
                              onPressed: () {},
                            ),
                            const SizedBox(width: 16),
                            CustomIconButton(
                              icon: AssetPath.apple,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SlideInAnimation(
              direction: pi * .25,
              durationInMilliseconds: controller.baseDuration + 125,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      height: 1.35,
                      fontSize: 16,
                      letterSpacing: .2,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.signIn);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        height: 1.35,
                        fontSize: 16,
                        letterSpacing: .2,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
