import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../components/custom_text_button.dart';
import '../../../../constants/asset_paths.dart';
import '../../../../constants/space_widgets.dart';
import '../../../../utils/ui/animations/slide_in_animation.dart';
import '../../../sign_in/views/widgets/body_subtitle_text.dart';
import '../../../sign_in/views/widgets/headline_title_text.dart';
import '../../controllers/verify_identity_controller.dart';

class VerifyIdentityMobilePortrait extends GetView<VerifyIdentityController> {
  VerifyIdentityMobilePortrait({super.key});

  final arguments = Get.arguments;

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
                    child: SvgPicture.asset(AssetPath.userIcon),
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
                        durationInMilliseconds: controller.baseDuration + 25,
                        child: const HeadlineTitleText(
                          primaryText: "Verify your identity",
                        ),
                      ),
                      SlideInAnimation(
                        direction: pi * .25,
                        durationInMilliseconds: controller.baseDuration + 50,
                        child: const BodySubTitleText(
                          primaryText: 'Where would you like ',
                          accentText: 'Smartpay',
                          subPrimaryText: ' to send your security code?',
                        ),
                      ),
                      SlideInAnimation(
                        direction: pi * .25,
                        durationInMilliseconds: controller.baseDuration + 75,
                        child: Container(
                          height: 88,
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.04),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AssetPath.bgCheckIcon),
                                  const SizedBox(width: 18),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                          fontSize: 16,
                                          letterSpacing: .2,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        arguments[0],
                                        style: TextStyle(
                                          fontSize: 12,
                                          letterSpacing: .1,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(.65),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 18),
                                ],
                              ),
                              SvgPicture.asset(AssetPath.emailIcon),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSpace(32),
                    ],
                  ),
                ),
              ],
            ),
            SlideInAnimation(
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
                      buttonText: 'Continue',
                      onPressed: () => controller.navigateToNewPasswordView(),
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
