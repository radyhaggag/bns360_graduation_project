import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

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
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: S.of(context).write_your_review,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        fillColor: Theme.of(context).listTileTheme.tileColor,
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).primaryColor.withOpacity(.3),
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
