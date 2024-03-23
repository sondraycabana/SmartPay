import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/routes/app_pages.dart';
import '../../controllers/onboarding_controller.dart';

class SkipButton extends GetView<OnboardingController> {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 12.0,
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.toNamed(Routes.signIn);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            child: Text(
              'Skip',
              style: TextStyle(
                height: 1.6,
                fontSize: 16.5,
                letterSpacing: .2,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).indicatorColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
