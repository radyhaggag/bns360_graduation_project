import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_styles.dart';

abstract class ThemeConfig {
  static ThemeData getLightTheme() {
    return ThemeData(
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
          textStyle: AppStyles.getMediumStyle(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: AppStyles.getRegularStyle(),
      ),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData();
  }
}
