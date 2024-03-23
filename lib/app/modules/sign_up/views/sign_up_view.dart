import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/sign_up_controller.dart';
import 'mobile/sign_up_mobile_portrait.dart';

/// this widget holds all the different screen sizes and it's responsible
/// for splitting the views to their appropriate size.
/// please take a look at the [responsive_builder] package for more
/// understanding.

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => SignUpMobilePortrait(),
        landscape: (_) =>
            SignUpMobilePortrait(), // replace with landscape view for mobile
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) =>
            SignUpMobilePortrait(), // replace with portrait view for tablet
        landscape: (_) =>
            SignUpMobilePortrait(), // replace with landscape view for tablet
      ),
    );
  }
}
