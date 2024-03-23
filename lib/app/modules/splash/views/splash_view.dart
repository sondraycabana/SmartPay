import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/splash_controller.dart';
import 'mobile/splash_mobile_portrait.dart';

/// this widget holds all the different screen sizes and it's responsible
/// for splitting the views to their appropriate size.
/// please take a look at the [responsive_builder] package for more
/// understanding.

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => SplashMobilePortrait(),
        landscape: (_) =>
            SplashMobilePortrait(), // replace with landscape view for mobile
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) =>
            SplashMobilePortrait(), // replace with portrait view for tablet
        landscape: (_) =>
            SplashMobilePortrait(), // replace with landscape view for tablet
      ),
    );
  }
}
