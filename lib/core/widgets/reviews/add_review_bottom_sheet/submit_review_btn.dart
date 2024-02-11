import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../buttons/custom_buttons.dart';
import '../../../../generated/l10n.dart';

class SubmitReviewBtn extends StatelessWidget {
  const SubmitReviewBtn({super.key, this.onSubmit});

  final void Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      label: S.of(context).send,
      onPressed: () => onSubmit?.call(),
      width: 100.w,
    );
  }
}
