import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/constants.dart';
import '../../../utils/extensions/context.dart';
import '../../../utils/extensions/media_query.dart';
import '../../ratings_item_with_count.dart';

part 'left_section.dart';
part 'right_section.dart';
part 'view_reviews_btn.dart';

class MainReviewSummaryCard extends StatelessWidget {
  const MainReviewSummaryCard({
    super.key,
    required this.starsCount,
    required this.numOfRatings,
    this.showViewAllBtn = true,
    this.showReviewSummaryTxt = true,
    this.onViewAllTap,
    this.mainColor,
    this.fiveStarCount = 0,
    this.fourStarCount = 0,
    this.threeStarCount = 0,
    this.twoStarCount = 0,
    this.oneStarCount = 0,
  });

  final num starsCount;
  final int numOfRatings;
  final bool showViewAllBtn;
  final bool showReviewSummaryTxt;
  final void Function()? onViewAllTap;
  final Color? mainColor;
  final int fiveStarCount;
  final int fourStarCount;
  final int threeStarCount;
  final int twoStarCount;
  final int oneStarCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: kHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: mainColor ?? context.theme.highlightColor,
        borderRadius: BorderRadius.circular(16),
      ),
      width: context.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _LeftSection(
            starsCount: starsCount,
            numOfRatings: numOfRatings,
            showReviewSummaryTxt: showReviewSummaryTxt,
          ),
          _RightSection(
            showViewAllBtn: showViewAllBtn,
            onViewAllTap: onViewAllTap,
            fiveStarCount: fiveStarCount,
            fourStarCount: fourStarCount,
            threeStarCount: threeStarCount,
            twoStarCount: twoStarCount,
            oneStarCount: oneStarCount,
          ),
        ],
      ),
    );
  }
}
