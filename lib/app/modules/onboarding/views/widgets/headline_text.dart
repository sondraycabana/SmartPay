import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding_controller.dart';

class HeadlineText extends GetView<OnboardingController> {
  const HeadlineText(this.headlineText, {Key? key}) : super(key: key);

  final String headlineText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Text(
        headlineText,
        style: TextStyle(
          height: 1.25,
          fontSize: 25,
          letterSpacing: -.2,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
