import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          RatingBar.builder(
            initialRating: starsCount.toDouble(),
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: size ?? 15.r,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (_) {},
            glow: false,
            ignoreGestures: true,
          ),
          const SizedBox(width: 5),
          if (addReviewerTxt)
            Text(
              "$numOfRatings Reviewer",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(.3),
                    fontSize: AppFontSize.details,
                  ),
            )
          else
            Text(
              "($numOfRatings)",
              style: Theme.of(context).textTheme.bodySmall,
            )
        ],
      ),
    );
  }
}
