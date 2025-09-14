import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/buttons/custom_buttons.dart';

class GuestConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const GuestConfirmationDialog({
    super.key,
    required this.onConfirm,
  });

  static void show(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GuestConfirmationDialog(
          onConfirm: onConfirm,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.theme.highlightColor,
      content: Text(
        S.of(context).continueAsGuestMessage,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: context.theme.primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
      actionsOverflowAlignment: OverflowBarAlignment.center,
      actions: [
        CustomOutlinedButton(
          onPressed: onConfirm,
          label: S.of(context).continueAsGuest,
          height: 40.h,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.red,
        ),
        10.verticalSpace,
        CustomOutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          label: S.of(context).cancel,
          height: 40.h,
          backgroundColor: Colors.transparent,
          foregroundColor: context.theme.primaryColor,
        ),
      ],
    );
  }
}
