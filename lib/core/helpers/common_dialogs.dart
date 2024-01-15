import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import '../utils/app_styles.dart';

abstract class CommonDialogs {
  static void showErrorDialog(BuildContext context, {required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          size: 50,
          color: AppColors.error,
        ),
        title: Text(
          message,
          style: AppStyles.getMediumStyle(fontSize: AppFontSize.details),
        ),
      ),
    );
  }
}
