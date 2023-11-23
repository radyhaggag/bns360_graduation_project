import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      fontSize ?? AppFontSize.subTitle,
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

  static TextStyle getCaptionsStyle({
    double? fontSize,
    Color? color,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize ?? AppFontSize.body,
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.black,
    );
  }
}
