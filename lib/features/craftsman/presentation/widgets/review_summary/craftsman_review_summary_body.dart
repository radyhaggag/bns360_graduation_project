import 'package:bns360_graduation_project/core/shared_data/entities/review_summary_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../../core/widgets/buttons/write_review_btn.dart';
import '../../../../../core/widgets/reviews/sliver_reviews_app_bar_delegate.dart';
import 'craftsman_review_summary_app_bar.dart';
import 'reviews_builder.dart';

class CraftsmanReviewSummaryBody extends StatelessWidget {
  const CraftsmanReviewSummaryBody({
    super.key,
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const CraftsmanReviewSummaryAppBar(),
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: SliverReviewsAppBarDelegate(
              reviewSummary: const ReviewSummaryEntity.empty(),
            ),
          ),
          if (!craftsmanEntity.isBelongToMe)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              sliver: SliverToBoxAdapter(
                child: WriteReviewBtn(
                  addReviewCallback: (rating, value) {},
                ),
              ),
            ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            sliver: const SliverToBoxAdapter(
              child: CraftsmanReviewsBuilder(),
            ),
          ),
        ],
      ),
    );
  }
}
