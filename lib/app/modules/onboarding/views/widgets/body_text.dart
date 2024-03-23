import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding_controller.dart';

class BodyText extends GetView<OnboardingController> {
  const BodyText(this.bodyText, {Key? key}) : super(key: key);

  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .14),
      child: Text(
        bodyText,
        style: TextStyle(
          height: 1.5,
          fontSize: 15,
          letterSpacing: .2,
          color: Theme.of(context).hintColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
