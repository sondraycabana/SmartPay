import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class CustomTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'SF-Pro-Display',
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: Colors.transparent,
    ),
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
      opacity: 0.8,
    ),
    sliderTheme: SliderThemeData(
      trackHeight: 1.0,
      thumbColor: AppColors.accentColor,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
      overlayColor: AppColors.accentColor.withOpacity(.1),
      activeTrackColor: AppColors.accentColor,
      inactiveTrackColor: AppColors.primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: MaterialStateColor.resolveWith((states) {
        Color color = Colors.grey;
        if (states.contains(MaterialState.error)) {
          color = Colors.red;
        } else if (states.contains(MaterialState.focused)) {
          color = AppColors.primaryColor;
        }
        return color;
      }),
      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
        (Set<MaterialState> states) {
          Color color = Colors.grey;
          if (states.contains(MaterialState.error)) {
            color = Colors.red;
          } else if (states.contains(MaterialState.focused)) {
            color = AppColors.primaryColor;
          }
          return TextStyle(color: color, fontSize: 12);
        },
      ),
    ),
    primaryColor: AppColors.primaryColor,
    canvasColor: Colors.white,
    hintColor: AppColors.hintColor,
    indicatorColor: AppColors.lightTealColor,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.accentColor),
  );
}
