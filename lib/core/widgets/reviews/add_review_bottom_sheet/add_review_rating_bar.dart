import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class AddReviewRatingBar extends StatelessWidget {
  const AddReviewRatingBar({super.key, required this.onRatingUpdate});
  final void Function(double) onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).tap_to_rate,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.theme.primaryColor.withOpacity(.3),
          ),
        ),
        RatingBar(
          glowColor: Colors.white,
          allowHalfRating: true,
          itemSize: starSize,
          itemPadding: EdgeInsets.zero,
          ratingWidget: RatingWidget(
            empty: Icon(
              Icons.star_border,
              color: starColor,
            ),
            half: Icon(
              Icons.star_half,
              color: starColor,
            ),
            full: Icon(
              Icons.star,
              color: starColor,
            ),
          ),
          onRatingUpdate: onRatingUpdate,
        ),
      ],
    );
  }

  Color get starColor => Colors.amber;
  double get starSize => 30.r;
}
