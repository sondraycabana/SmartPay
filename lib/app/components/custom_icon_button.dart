import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_colors.dart';
import '../constants/asset_paths.dart';


class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    this.buttonColor = Colors.white,
    this.icon = AssetPath.apple,
    this.iconSize = const Size(12, 12),
    this.splashColor = AppColors.primaryColor,
    this.fontWeight,
    this.fontSize,
  });

  final void Function()? onPressed;
  final String icon;
  final Color splashColor, buttonColor;
  final Size iconSize;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).hintColor.withOpacity(.2),
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            onPrimary: splashColor,
            primary: buttonColor,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          child: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}
