import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.icon = 'assets/svgs/arrow_right.svg',
    this.iconSize = const Size(12, 12),
    this.splashColor = AppColors.primaryColor,
    this.isLoading = false,
    this.fontWeight,
    this.fontSize,
    this.loadingColor = Colors.white,
    this.loadingButtonColor,
  });

  final void Function()? onPressed;
  final String buttonText, icon;
  final Color splashColor, textColor, buttonColor, loadingColor;
  final Color? loadingButtonColor;
  final bool isLoading;
  final Size iconSize;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: ElevatedButton(
          onPressed: isLoading ? () {} : onPressed,
          style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            onPrimary: splashColor,
            primary: isLoading
                ? loadingButtonColor ??
                    Theme.of(context).primaryColor.withOpacity(.35)
                : buttonColor,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          child: isLoading
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),

                 child: SpinKitWave(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: loadingColor,
                        ),
                      );
                    },
                    type: SpinKitWaveType.start,
                    size: 24.0,
                    itemCount: 5,
                  ),
                )
              : Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: fontSize ?? 16,
                    color: textColor,
                    fontWeight: fontWeight ?? FontWeight.w700,
                    letterSpacing: .5,
                  ),
                ),
        ),
      ),
    );
  }
}
