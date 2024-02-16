import 'package:flutter/widgets.dart';

import '../../utils/main_logger.dart';
import 'custom_buttons.dart';
import '../../../generated/l10n.dart';
import '../reviews/add_review_bottom_sheet/add_review_bottom_sheet.dart';

class WriteReviewBtn extends StatelessWidget {
  const WriteReviewBtn({
    super.key,
    required this.addReviewCallback,
  });

  final void Function(double, String) addReviewCallback;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      label: S.of(context).write_review,
      onPressed: () {
        AddReviewBottomSheet.show(
          context: context,
          addReviewCallback: (rating, review) {
            logger.i("Rating value $rating , Review $review");
          },
        );
      },
      borderRadius: BorderRadius.circular(16),
    );
  }
}
