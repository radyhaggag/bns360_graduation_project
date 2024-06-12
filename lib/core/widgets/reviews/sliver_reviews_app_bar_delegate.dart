import 'dart:math' as math;

import '../../shared_data/entities/review_summary_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import '../../utils/extensions/context.dart';
import 'main_review_summary_card/main_review_summary_card.dart';

class SliverReviewsAppBarDelegate extends SliverPersistentHeaderDelegate {
  final ReviewSummaryEntity reviewSummary;

  SliverReviewsAppBarDelegate({
    required this.reviewSummary,
  });

  final _minHeight = 120.h;
  final _maxHeight = 135.h;

  @override
  double get minExtent => _minHeight;

  @override
  double get maxExtent => math.max(_maxHeight, _minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(
      child: child(context),
    );
  }

  Widget child(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 10.h,
      ),
      color: AppColors.backgroundColor(context),
      child: MainReviewSummaryCard(
        numOfRatings: reviewSummary.totalReviews,
        starsCount: reviewSummary.averageRating,
        showReviewSummaryTxt: false,
        showViewAllBtn: false,
        mainColor: context.theme.highlightColor,
        fiveStarCount: reviewSummary.fiveStars,
        fourStarCount: reviewSummary.fourStars,
        threeStarCount: reviewSummary.threeStars,
        twoStarCount: reviewSummary.twoStars,
        oneStarCount: reviewSummary.oneStars,
      ),
    );
  }

  @override
  bool shouldRebuild(SliverReviewsAppBarDelegate oldDelegate) {
    return _maxHeight != oldDelegate._maxHeight ||
        _minHeight != oldDelegate._minHeight ||
        child != oldDelegate.child;
  }
}
