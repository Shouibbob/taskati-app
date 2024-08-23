import 'package:flutter/material.dart';
import 'package:taskaty_app/core/utils/colors.dart';

TextStyle getTitleTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 18,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? AppColors.blackColor,
  );
}

TextStyle getBodyTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 16,
    color: color ?? AppColors.blackColor,
  );
}

TextStyle getSmallTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 14,
    color: color ?? AppColors.accentColor,
  );
}
