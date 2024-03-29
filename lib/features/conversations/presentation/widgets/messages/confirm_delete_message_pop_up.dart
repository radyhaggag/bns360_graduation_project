import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const ConfirmationDialog({
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
        return ConfirmationDialog(onConfirm: onConfirm);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.theme.highlightColor,
      content: Text(
        S.of(context).confirm_delete_message,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: context.theme.primaryColor,
        ),
      ),
      actions: [
        CustomTextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          label: S.of(context).cancel,
          // child: Text(
          //   S.of(context).cancel,
          //   style: const TextStyle(color: Colors.black),
          // ),
          width: 100.w,
          height: 35.h,
        ),
        CustomElevatedButton(
          onPressed: onConfirm,
          label: S.of(context).delete,
          width: 100.w,
          height: 35.h,
          backgroundColor: AppColors.red,
        ),
      ],
    );
  }
}
