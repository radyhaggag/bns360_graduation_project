import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'buttons/custom_buttons.dart';

class ContinueWithPersonalAccount extends StatelessWidget {
  const ContinueWithPersonalAccount({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: CustomElevatedButton(
        onPressed: onPressed,
        label: S.of(context).continue_with_your_personal_account,
        height: 35.h,
      ),
    );
  }
}
