import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/custom_icon_back_button.dart';
import '../../../../components/custom_text_button.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../constants/space_widgets.dart';
import '../../../../utils/ui/animations/slide_in_animation.dart';
import '../../../sign_in/views/widgets/headline_title_text.dart';
import '../../controllers/update_profile_controller.dart';
import '../widgets/bottom_sheets/select_country_bottom_sheet.dart';

class UpdateProfileMobilePortrait extends GetView<UpdateProfileController> {
  const UpdateProfileMobilePortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 24.0, top: 12),
                    child: BackIconButton(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32.0,
                      left: 24.0,
                      right: 24.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SlideInAnimation(
                          direction: pi * .25,
                          durationInMilliseconds: controller.baseDuration,
                          child: const HeadlineTitleText(
                            primaryText: "Hey there! tell us a bit\nabout ",
                            accentText: "yourself",
                          ),
                        ),
                        const VerticalSpace(32),
                        SlideInAnimation(
                          direction: pi * .25,
                          durationInMilliseconds: controller.baseDuration + 25,
                          child: CustomTextField(
                            controller: controller.fullName,
                            hintText: 'Full name',
                            onChanged: (_) => controller.validateFullName(),
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.name,
                          ),
                        ),
                        const VerticalSpace(16),
                        SlideInAnimation(
                          direction: pi * .25,
                          durationInMilliseconds: controller.baseDuration + 50,
                          child: CustomTextField(
                            controller: controller.userName,
                            hintText: 'Username (Optional)',
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.name,
                          ),
                        ),
                        const VerticalSpace(16),
                        SlideInAnimation(
                          direction: pi * .25,
                          durationInMilliseconds: controller.baseDuration + 75,
                          child: CustomTextField(
                            isBottomSheetField: true,
                            readOnly: true,
                            onChanged: (_) => controller.validateCountry(),
                            controller: controller.country,
                            textInputAction: TextInputAction.next,
                            hintText: 'Select Country',
                            onTap: () {
                              Get.bottomSheet<bool>(
                                const SelectCountryBottomSheet(),
                                isScrollControlled: true,
                                isDismissible: false,
                              );
                            },
                          ),
                        ),
                        const VerticalSpace(16),
                        SlideInAnimation(
                          direction: pi * .25,
                          durationInMilliseconds: controller.baseDuration + 100,
                          child: CustomTextField(
                            isPasswordField: true,
                            controller: controller.password,
                            hintText: 'Password',
                            onTap: () => controller.validatePassword(),
                            onChanged: (_) => controller.validatePassword(),
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                          ),
                        ),
                        const VerticalSpace(8),
                        controller.showPasswordInfo.value
                            ? AnimatedContainer(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(.08),
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                duration: const Duration(milliseconds: 250),
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Password should contain at least 8 characters, 1 uppercase, 1 lowercase, 1 numeric number, 1 special character ( ! @ # \$ & * ~ ).",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.65),
                                    height: 1.45,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    letterSpacing: .2,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const VerticalSpace(24),
                        Obx(
                          () => SlideInAnimation(
                            direction: pi * .25,
                            durationInMilliseconds:
                                controller.baseDuration + 125,
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                CustomTextButton(
                                  isLoading: controller.isLoading.value,
                                  buttonColor: controller.buttonColor.value,
                                  buttonText: 'Continue',
                                  onPressed: () => controller.signUp(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
