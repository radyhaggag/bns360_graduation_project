import 'extensions/context.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

abstract class AppStyles {
  static TextStyle _getTextStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle getBlackStyle({
    double? fontSize,
    Color? color,
  }) {
    return _getTextStyle(
      fontSize ?? AppFontSize.large,
      FontWeight.bold,
      color ?? AppColors.black,
    );
  }

  static TextStyle getBoldStyle({
    double? fontSize,
    Color? color,
  }) {
    return _getTextStyle(
      fontSize ?? AppFontSize.title,
      FontWeight.bold,
      color ?? AppColors.black,
    );
  }

  static TextStyle getSemiBoldStyle({
    double? fontSize,
    Color? color,
  }) {
    return _getTextStyle(
      fontSize ?? AppFontSize.body,
      FontWeight.w600,
      color ?? AppColors.black,
    );
  }

  static TextStyle getMediumStyle({
    double? fontSize,
    Color? color,
  }) {
    return _getTextStyle(
      fontSize ?? AppFontSize.body,
      FontWeight.w500,
      color ?? AppColors.black,
    );
  }

  static TextStyle getRegularStyle({
    double? fontSize,
    Color? color,
  }) {
    return _getTextStyle(
      fontSize ?? AppFontSize.details,
      FontWeight.w400,
      color ?? AppColors.black,
    );
  }

  static TextStyle getLightStyle({
    double? fontSize,
    Color? color,
  }) {
    return _getTextStyle(
      fontSize ?? AppFontSize.light,
      FontWeight.w300,
      color ?? AppColors.black,
    );
  }

  static TextStyle? authScreensDetailsStyle(BuildContext context) {
    return context.textTheme.bodyMedium?.copyWith(
      color: context.theme.primaryColor.withOpacity(.7),
    );
  }
}
