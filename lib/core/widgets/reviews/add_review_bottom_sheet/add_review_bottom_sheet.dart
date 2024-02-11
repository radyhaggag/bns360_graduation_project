import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_fonts.dart';
import '../../../../generated/l10n.dart';
import 'add_review_rating_bar.dart';
import 'add_review_text_field.dart';
import 'submit_review_btn.dart';

typedef AddReviewCallback = void Function(double rating, String review);

class AddReviewBottomSheet extends StatefulWidget {
  const AddReviewBottomSheet({
    super.key,
    required this.addReviewCallback,
  });

  final AddReviewCallback addReviewCallback;

  static show({
    required BuildContext context,
    required AddReviewCallback addReviewCallback,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BottomSheet(
        onClosing: () {},
        enableDrag: false,
        backgroundColor: Theme.of(context).highlightColor,
        builder: (context) => AddReviewBottomSheet(
          addReviewCallback: addReviewCallback,
        ),
      ),
    );
  }

  @override
  State<AddReviewBottomSheet> createState() => _AddReviewBottomSheetState();
}

class _AddReviewBottomSheetState extends State<AddReviewBottomSheet> {
  double rate = 0.0;
  onRatingUpdate(double value) => setState(() => rate = value);
  final reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        top: 25.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 25.h,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).write_review,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).cardColor,
                  fontSize: AppFontSize.subTitle,
                ),
          ),
          const SizedBox(height: 30),
          AddReviewRatingBar(
            onRatingUpdate: onRatingUpdate,
          ),
          const SizedBox(height: 30),
          AddReviewTextField(
            textController: reviewController,
          ),
          const SizedBox(height: 30),
          SubmitReviewBtn(
            onSubmit: () {
              final review = reviewController.text;
              widget.addReviewCallback.call(rate, review);
            },
          ),
        ],
      ),
    );
  }
}
