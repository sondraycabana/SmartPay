import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/update_profile_controller.dart';
import 'mobile/update_profile_mobile_portrait.dart';

/// this widget holds all the different screen sizes and it's responsible
/// for splitting the views to their appropriate size.
/// please take a look at the [responsive_builder] package for more
/// understanding.

class UpdateProfileView extends GetView<UpdateProfileController> {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => UpdateProfileMobilePortrait(),
        landscape: (_) =>
            UpdateProfileMobilePortrait(), // replace with landscape view for mobile
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) =>
            UpdateProfileMobilePortrait(), // replace with portrait view for tablet
        landscape: (_) =>
            UpdateProfileMobilePortrait(), // replace with landscape view for tablet
      ),
    );
  }
}
