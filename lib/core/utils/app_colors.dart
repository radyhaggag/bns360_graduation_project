import 'package:flutter/material.dart';

abstract class AppColors {
  static const black = Color(0xff121212);
  static const white = Color(0xffffffff);
  static const grey = Color(0xff808080);
  static const red = Color(0xffB00020);

  // Color platte [Changing according to the app ui]
  static const primary = Color(0xff222043);
  static const secondary = Color(0xffE1ECC8);
  static const light = Color(0xffD9D9D9);
  static final black25 = const Color(0xff121212).withOpacity(.25);
  static final hint = const Color(0xff121212).withOpacity(.1);
  static final details = const Color(0xff121212).withOpacity(.7);
  static const success = Color(0xff4A875F);
  static const error = Color(0xffFF6767);
}
