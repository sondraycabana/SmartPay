import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';


import '../../../../../components/custom_bottom_sheet.dart';
import '../../../../../components/custom_text_field.dart';
import '../../../../../constants/space_widgets.dart';
import '../../../../../utils/ui/animations/slide_in_animation.dart';
import '../../../controllers/update_profile_controller.dart';
import '../../../models/country_model.dart';
import '../cancel_button.dart';
import '../select_country_button.dart';

class SelectCountryBottomSheet extends GetView<UpdateProfileController> {
  const SelectCountryBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.isSearchListEmpty.value = true;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: CustomBottomSheet(
        height: controller.height.value * 1.5,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 32,
            ),
            height: controller.height.value * 1.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SlideInAnimation(
                  direction: pi * .5,
                  durationInMilliseconds: controller.baseDuration,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: controller.search,
                          hintText: 'Search',
                          isSearchField: true,
                          onChanged: (_) => controller.searchCountry(
                              query: controller.search.text),
                        ),
                      ),
                      const HorizontalSpace(18),
                      const CancelButton(),
                    ],
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 0),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.isSearchListEmpty.value &&
                              controller.search.text == ""
                          ? controller.countries.length
                          : controller.searchResult.length,
                      itemBuilder: (BuildContext context, int index) {
                        List<CountryModel> data =
                            controller.isSearchListEmpty.value &&
                                    controller.search.text == ""
                                ? controller.countries
                                : controller.searchResult;
                        return SlideInAnimation(
                          direction: pi * .5,
                          durationInMilliseconds: controller.baseDuration + 25,
                          child: CountryButton(
                            icon: data[index].icon,
                            name: data[index].name,
                            abbr: data[index].abbr,
                            checkIconOpacity:
                                controller.selectedCountry.value ==
                                        data[index].abbr
                                    ? 1.0
                                    : 0.0,
                            color: controller.selectedCountry.value ==
                                    data[index].abbr
                                ? Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.04)
                                : Colors.transparent,
                            onTap: () => controller.selectCountry(
                              selectedCountyAbbr: data[index].abbr,
                              selectedCountyName: data[index].name,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
