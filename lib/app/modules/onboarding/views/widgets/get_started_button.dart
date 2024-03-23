import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../components/custom_text_button.dart';
import '../../controllers/onboarding_controller.dart';

class GetStartedButton extends GetView<OnboardingController> {
  const GetStartedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40.0,
        right: 40.0,
        bottom: 54.0,
        top: 40.0,
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          CustomTextButton(
            buttonText: 'Get Started',
            onPressed: () => controller.navigateToSignIn(),
          ),
        ],
      ),
    );
  }
}
