import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/asset_paths.dart';
import '../../controllers/update_profile_controller.dart';

class CountryButton extends GetView<UpdateProfileController> {
  final String icon, name, abbr;
  final Color color;
  final double checkIconOpacity;
  final void Function()? onTap;

  const CountryButton({
    super.key,
    required this.icon,
    required this.name,
    required this.abbr,
    required this.color,
    this.checkIconOpacity = 0.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(icon),
                const SizedBox(width: 16),
                Text(
                  abbr,
                  style: TextStyle(
                    height: 1.35,
                    fontSize: 16,
                    letterSpacing: .1,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(width: 18),
                Text(
                  name,
                  style: TextStyle(
                    height: 1.35,
                    fontSize: 16,
                    letterSpacing: .1,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Opacity(
                opacity: checkIconOpacity,
                child: SvgPicture.asset(AssetPath.normalCheckIcon)),
          ],
        ),
      ),
    );
  }
}