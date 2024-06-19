import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import '../utils/app_styles.dart';
import '../widgets/buttons/custom_buttons.dart';

abstract class CommonDialogs {
  static void showErrorDialog(
    BuildContext context, {
    required String message,
    Widget? customWidget,
  }) {
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
        actions: customWidget != null
            ? [
                customWidget,
              ]
            : [],
      ),
    );
  }

  static Future<void> showSuccessDialog(
    BuildContext context, {
    required String message,
  }) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.check,
          size: 50,
          color: AppColors.green,
        ),
        title: Text(
          message,
          style: AppStyles.getMediumStyle(fontSize: AppFontSize.details),
        ),
        actions: [
          CustomElevatedButton(
            label: S.of(context).ok,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
