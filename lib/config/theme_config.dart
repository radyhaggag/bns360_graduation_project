import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_fonts.dart';
import '../core/utils/app_styles.dart';

abstract class ThemeConfig {
  static ThemeData getLightTheme() {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.primary),
    );
    return ThemeData(
      fontFamily: 'Poppins',
      textTheme: TextTheme(
        titleLarge: AppStyles.getBlackStyle(),
        titleMedium: AppStyles.getBoldStyle(),
        titleSmall: AppStyles.getSemiBoldStyle(),
        bodyLarge: AppStyles.getRegularStyle(),
        bodyMedium: AppStyles.getMediumStyle(),
        bodySmall: AppStyles.getLightStyle(color: AppColors.grey),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: AppStyles.getSemiBoldStyle(),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: AppStyles.getSemiBoldStyle(),
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(color: AppColors.primary),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: AppStyles.getSemiBoldStyle(),
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.primary,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: AppStyles.getRegularStyle(),
        backgroundColor: AppColors.white,
      ),
      indicatorColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        errorBorder: outlineInputBorder.copyWith(
          borderSide: const BorderSide(color: AppColors.red),
        ),
        hintStyle: AppStyles.getRegularStyle(color: AppColors.black25),
        labelStyle: AppStyles.getRegularStyle(fontSize: AppFontSize.body),
      ),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData();
  }

  static void configureStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
    ));
  }
}
