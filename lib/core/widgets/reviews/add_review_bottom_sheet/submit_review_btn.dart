import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../buttons/custom_buttons.dart';

class SubmitReviewBtn extends StatelessWidget {
  const SubmitReviewBtn({
    super.key,
    this.onSubmit,
    this.isDisabled = false,
  });

  final void Function()? onSubmit;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      label: S.of(context).send,
      onPressed: () => onSubmit?.call(),
      isDisabled: isDisabled,
      width: 100.w,
    );
  }
}
