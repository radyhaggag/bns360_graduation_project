import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';
import '../utils/app_colors.dart';
import '../utils/extensions/context.dart';
import 'buttons/custom_buttons.dart';

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final String message;

  const ConfirmationDialog({
    super.key,
    required this.onConfirm,
    required this.message,
  });

  static void show(
    BuildContext context, {
    required VoidCallback onConfirm,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          onConfirm: onConfirm,
          message: message,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.theme.highlightColor,
      content: Text(
        message,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: context.theme.primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        CustomOutlinedButton(
          onPressed: onConfirm,
          label: S.of(context).delete,
          width: 100.w,
          height: 35.h,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.red,
        ),
        CustomOutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          label: S.of(context).cancel,
          width: 100.w,
          height: 35.h,
          backgroundColor: Colors.transparent,
          foregroundColor: context.theme.primaryColor,
        ),
      ],
    );
  }
}
