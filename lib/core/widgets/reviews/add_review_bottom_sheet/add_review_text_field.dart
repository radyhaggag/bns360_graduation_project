import '../../../utils/app_fonts.dart';
import '../../../utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../utils/app_colors.dart';

class AddReviewTextField extends StatelessWidget {
  const AddReviewTextField({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      maxLines: 5,
      textInputAction: TextInputAction.done,
      style: context.textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: S.of(context).write_your_review,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        fillColor: AppColors.backgroundColor(context),
        hintStyle: context.textTheme.bodyLarge?.copyWith(
          color: context.theme.primaryColor.withOpacity(.3),
          fontSize: AppFontSize.details,
        ),
        filled: true,
      ),
    );
  }

  InputBorder get inputBorder {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
