import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  static const black = Color(0xff121212);
  static const white = Color(0xffffffff);
  static const grey = Color(0xff808080);
  static const red = Color(0xffB00020);
  static const green = Color(0xff4A875F);

  // Color platte [Changing according to the app ui]
  static const primary = Color(0xff222043);
  static const secondary = Color(0xffE1ECC8);
  static const light = Color(0xffD9D9D9);
  static const black25 = Color(0x40121212);
  static const black50 = Color(0x80000000);
  static const details = Color(0xfB321212);
  static const error = Color(0xffFF6767);
  static const lightBackground = Color(0xFFF5F5F5);

  // Colors for dark theme
  static const surface = Color(0xff222222);
  static const darkScaffoldBackground = Color.fromARGB(255, 0, 0, 0);
  static const darkBackground = Color(0xff121212);
  static const white80 = Color(0xccffffff);
  static const white50 = Color(0x80ffffff);
  static const white25 = Color(0x40ffffff);

  ///
  static backgroundColor(BuildContext context) {
    return context.theme.brightness == Brightness.light
        ? context.theme.listTileTheme.tileColor
        : context.theme.scaffoldBackgroundColor;
  }
}
