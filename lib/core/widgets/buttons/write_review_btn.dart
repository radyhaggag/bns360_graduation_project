import 'package:flutter/widgets.dart';

import '../../../generated/l10n.dart';
import '../reviews/add_review_bottom_sheet/add_review_bottom_sheet.dart';
import 'custom_buttons.dart';

class WriteReviewBtn extends StatelessWidget {
  const WriteReviewBtn({
    super.key,
    required this.addReviewCallback,
    this.submitBtnWidget,
    this.isLoading = false,
  });

  final void Function(double, String) addReviewCallback;
  final Widget? submitBtnWidget;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      label: S.of(context).write_review,
      isLoading: isLoading,
      onPressed: () {
        AddReviewBottomSheet.show(
          context: context,
          addReviewCallback: addReviewCallback,
        );
      },
      borderRadius: BorderRadius.circular(24),
    );
  }
}
