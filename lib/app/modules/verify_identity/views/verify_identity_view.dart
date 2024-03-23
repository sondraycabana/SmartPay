import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/verify_identity_controller.dart';
import 'mobile/verify_identity_mobile_portrait.dart';

/// this widget holds all the different screen sizes and it's responsible
/// for splitting the views to their appropriate size.
/// please take a look at the [responsive_builder] package for more
/// understanding.

class VerifyIdentityView extends GetView<VerifyIdentityController> {
  const VerifyIdentityView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => VerifyIdentityMobilePortrait(),
        landscape: (_) =>
            VerifyIdentityMobilePortrait(), // replace with landscape view for mobile
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) =>
            VerifyIdentityMobilePortrait(), // replace with portrait view for tablet
        landscape: (_) =>
            VerifyIdentityMobilePortrait(), // replace with landscape view for tablet
      ),
    );
  }
}
