import 'package:bns360_graduation_project/core/extensions/media_query.dart';
import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/widgets/ratings_item_with_count.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_fonts.dart';
import '../../utils/constants.dart';

part 'left_section.dart';
part 'right_section.dart';
part 'view_reviews_btn.dart';

class MainReviewCard extends StatelessWidget {
  const MainReviewCard({super.key});

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
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _LeftSection(),
          _RightSection(),
        ],
      ),
    );
  }
}
