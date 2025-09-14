import '../utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/app_fonts.dart';
import 'main_rating_bar.dart';

class RatingsItemWithCount extends StatelessWidget {
  final num starsCount;
  final int numOfRatings;
  final double? size;
  final bool addReviewerTxt;
  final double? horizontalPadding;
  const RatingsItemWithCount({
    super.key,
    required this.starsCount,
    required this.numOfRatings,
    this.size,
    this.addReviewerTxt = false,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 10),
      child: Row(
        children: [
          MainRatingBar(
            starsCount: starsCount,
            size: size,
          ),
          const SizedBox(width: 5),
          if (addReviewerTxt)
            Text(
              "$numOfRatings ${S.of(context).reviewer}",
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.theme.primaryColor.withOpacity(.3),
                fontSize: AppFontSize.details,
              ),
            )
          else
            Text(
              "($numOfRatings)",
              style: context.textTheme.bodySmall,
            )
        ],
      ),
    );
  }
}
