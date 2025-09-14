import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/extensions/context.dart';
import 'add_review_rating_bar.dart';
import 'add_review_text_field.dart';
import 'submit_review_btn.dart';

typedef AddReviewCallback = void Function(double rating, String review);

class AddReviewBottomSheet extends StatefulWidget {
  const AddReviewBottomSheet({
    super.key,
    required this.addReviewCallback,
    this.initialReview,
    this.initialRating,
  });

  final AddReviewCallback addReviewCallback;
  final String? initialReview;
  final double? initialRating;

  static void show({
    required BuildContext context,
    required AddReviewCallback addReviewCallback,
    String? initialReview,
    double? initialRating,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BottomSheet(
        onClosing: () {},
        enableDrag: false,
        backgroundColor: context.theme.highlightColor,
        builder: (context) => AddReviewBottomSheet(
          addReviewCallback: addReviewCallback,
          initialReview: initialReview,
          initialRating: initialRating,
        ),
      ),
    );
  }

  @override
  State<AddReviewBottomSheet> createState() => _AddReviewBottomSheetState();
}

class _AddReviewBottomSheetState extends State<AddReviewBottomSheet> {
  double? rate;
  void onRatingUpdate(double value) => setState(() => rate = value);
  final reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    reviewController.text = widget.initialReview ?? '';
  }

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
        color: context.theme.highlightColor,
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
            style: context.textTheme.titleMedium?.copyWith(
              color: context.theme.cardColor,
              fontSize: AppFontSize.subTitle,
            ),
          ),
          const SizedBox(height: 30),
          AddReviewRatingBar(
            onRatingUpdate: onRatingUpdate,
            initialRating: widget.initialRating,
          ),
          const SizedBox(height: 30),
          AddReviewTextField(
            textController: reviewController,
          ),
          const SizedBox(height: 30),
          SubmitReviewBtn(
            isDisabled: rate == null,
            onSubmit: rate == null
                ? null
                : () {
                    final review = reviewController.text;
                    widget.addReviewCallback.call(rate!, review);
                    Navigator.pop(context);
                  },
          ),
        ],
      ),
    );
  }
}
