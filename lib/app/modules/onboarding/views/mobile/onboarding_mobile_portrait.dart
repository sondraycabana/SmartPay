import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding_controller.dart';
import '../widgets/body/onboarding_context.dart';
import '../widgets/get_started_button.dart';
import '../widgets/skip_button.dart';

class OnboardingMobilePortrait extends GetView<OnboardingController> {
  final _controller = Get.find<OnboardingController>();

  OnboardingMobilePortrait({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Screen Resolution ${Get.size}');
    }
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SkipButton(),
              const Spacer(),
              OnboardingContext(),
              SizedBox(height: Get.height * .04),
              const GetStartedButton(),
            ],
          ),
        ),
      ),
    );
  }
}

