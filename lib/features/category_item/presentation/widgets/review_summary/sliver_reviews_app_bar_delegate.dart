import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/main_review_summary_card/main_review_summary_card.dart';

class SliverReviewsAppBarDelegate extends SliverPersistentHeaderDelegate {
  final int numOfRatings;
  final num starsCount;
  SliverReviewsAppBarDelegate({
    required this.numOfRatings,
    required this.starsCount,
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
      color: Theme.of(context).listTileTheme.tileColor,
      child: MainReviewSummaryCard(
        numOfRatings: numOfRatings,
        starsCount: starsCount,
        showReviewSummaryTxt: false,
        showViewAllBtn: false,
        mainColor: Theme.of(context).highlightColor,
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
