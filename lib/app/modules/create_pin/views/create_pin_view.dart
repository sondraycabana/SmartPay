import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/create_pin_controller.dart';
import 'mobile/create_pin_mobile_portrait.dart';

/// this widget holds all the different screen sizes and it's responsible
/// for splitting the views to their appropriate size.
/// please take a look at the [responsive_builder] package for more
/// understanding.

class CreatePinView extends GetView<CreatePinController> {
  const CreatePinView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => CreatePinMobilePortrait(),
        landscape: (_) =>
            CreatePinMobilePortrait(), // replace with landscape view for mobile
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) =>
            CreatePinMobilePortrait(), // replace with portrait view for tablet
        landscape: (_) =>
            CreatePinMobilePortrait(), // replace with landscape view for tablet
      ),
    );
  }
}
