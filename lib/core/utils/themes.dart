import 'package:flutter/material.dart';
import 'package:taskaty_app/core/utils/colors.dart';
import 'package:taskaty_app/core/utils/text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.whiteColor),
    //custom color scheme for any color i want to use and use it in app
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      // about text color
      onSurface: AppColors.blackColor,
    ),
    // color for date
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.whiteColor,
      headerForegroundColor: AppColors.primaryColor,
    ),
    // color for time
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: AppColors.whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getSmallTextStyle(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.redColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.redColor,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkScaffoldBg,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.whiteColor,
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.darkScaffoldBg,
      headerForegroundColor: AppColors.primaryColor,
    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: AppColors.darkScaffoldBg,
      dialBackgroundColor: AppColors.darkAccent,
      hourMinuteTextColor: AppColors.primaryColor,
      dayPeriodColor: AppColors.darkAccent,
      hourMinuteColor: AppColors.darkAccent,
    ),
    scaffoldBackgroundColor: AppColors.darkScaffoldBg,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getSmallTextStyle(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.redColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.redColor,
        ),
      ),
    ),
  );
}
