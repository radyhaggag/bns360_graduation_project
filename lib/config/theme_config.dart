import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_fonts.dart';
import '../core/utils/app_styles.dart';

abstract class ThemeConfig {
  static final _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: AppColors.primary),
  );

  static ThemeData getLightTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      textTheme: TextTheme(
        titleLarge: AppStyles.getBlackStyle(),
        titleMedium: AppStyles.getBoldStyle(
          color: AppColors.primary,
        ),
        titleSmall: AppStyles.getSemiBoldStyle(),
        bodyLarge: AppStyles.getMediumStyle(),
        bodyMedium: AppStyles.getRegularStyle(),
        bodySmall: AppStyles.getLightStyle(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: AppStyles.getSemiBoldStyle(),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          disabledBackgroundColor: AppColors.primary.withOpacity(.5),
          disabledForegroundColor: AppColors.light,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.primary,
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
        titleTextStyle: AppStyles.getBoldStyle(
          color: AppColors.primary,
          fontSize: AppFontSize.title,
        ).copyWith(letterSpacing: .5),
        color: AppColors.white,
        systemOverlayStyle: _systemUiOverlayStyle,
        scrolledUnderElevation: 0.0,
      ),
      indicatorColor: AppColors.primary,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.white,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
        enabledBorder: _outlineInputBorder,
        errorBorder: _outlineInputBorder.copyWith(
          borderSide: const BorderSide(color: AppColors.red),
        ),
        hintStyle: AppStyles.getRegularStyle(color: AppColors.black25),
        labelStyle: AppStyles.getRegularStyle(fontSize: AppFontSize.body),
        suffixIconColor: AppColors.black25,
        prefixIconColor: AppColors.black25,
      ),
      cardTheme: const CardTheme(
        color: AppColors.white,
        elevation: 5.0,
        surfaceTintColor: AppColors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.black.withOpacity(.1),
          filled: true,
        ),
      ),
      hintColor: AppColors.black25,
      hoverColor: AppColors.black25,
      cardColor: AppColors.primary,
      splashColor: AppColors.white,
      highlightColor: AppColors.white,
      primaryColor: AppColors.black,
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      textTheme: TextTheme(
        titleLarge: AppStyles.getBlackStyle(color: AppColors.white80),
        titleMedium: AppStyles.getBoldStyle(color: AppColors.white80),
        titleSmall: AppStyles.getSemiBoldStyle(color: AppColors.white80),
        bodyLarge: AppStyles.getMediumStyle(color: AppColors.white80),
        bodyMedium: AppStyles.getRegularStyle(color: AppColors.white80),
        bodySmall: AppStyles.getLightStyle(color: AppColors.white80),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: AppStyles.getSemiBoldStyle(color: AppColors.white80),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          disabledBackgroundColor: AppColors.primary.withOpacity(.5),
          disabledForegroundColor: AppColors.white50,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          // backgroundColor: AppColors.white,
          foregroundColor: AppColors.white80,
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
          foregroundColor: AppColors.white80,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: AppStyles.getBoldStyle(
          color: AppColors.white80,
          fontSize: AppFontSize.title,
        ).copyWith(letterSpacing: .5),
        color: AppColors.surface,
        systemOverlayStyle: _systemUiOverlayStyle,
        scrolledUnderElevation: 0.0,
      ),
      indicatorColor: AppColors.primary,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.background,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
        enabledBorder: _outlineInputBorder,
        errorBorder: _outlineInputBorder.copyWith(
          borderSide: const BorderSide(color: AppColors.red),
        ),
        fillColor: AppColors.surface,
        filled: true,
        hintStyle: AppStyles.getRegularStyle(color: AppColors.white50),
        labelStyle: AppStyles.getRegularStyle(fontSize: AppFontSize.body),
        suffixIconColor: AppColors.white50,
        prefixIconColor: AppColors.white50,
      ),
      cardTheme: const CardTheme(
        color: AppColors.black,
        elevation: 5.0,
        surfaceTintColor: AppColors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
      ),
      dropdownMenuTheme: const DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.surface,
          filled: true,
        ),
      ),
      hintColor: AppColors.white25,
      hoverColor: AppColors.white80,
      cardColor: AppColors.white80,
      splashColor: AppColors.surface,
      highlightColor: AppColors.surface,
      primaryColor: AppColors.white,
    );
  }

  static const _systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: AppColors.primary,
    statusBarIconBrightness: Brightness.light,
  );

  static void configureStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(_systemUiOverlayStyle);
  }
}
