import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';
import '../../extensions/media_query.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/constants.dart';
import '../ratings_item_with_count.dart';

part 'left_section.dart';
part 'right_section.dart';
part 'view_reviews_btn.dart';

class MainReviewCard extends StatelessWidget {
  const MainReviewCard({
    super.key,
    required this.starsCount,
    required this.numOfRatings,
  });

  final num starsCount;
  final int numOfRatings;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: kHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).listTileTheme.tileColor,
        borderRadius: BorderRadius.circular(16),
      ),
      width: context.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _LeftSection(
            starsCount: starsCount,
            numOfRatings: numOfRatings,
          ),
          const _RightSection(),
        ],
      ),
    );
  }
}
