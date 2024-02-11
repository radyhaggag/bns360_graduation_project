import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/category_item_entity.dart';
import '../write_review_btn.dart';
import 'category_item_review_summary_app_bar.dart';
import '../../../../../core/widgets/reviews/sliver_reviews_app_bar_delegate.dart';
import 'reviews_builder.dart';

class CategoryItemReviewSummaryBody extends StatelessWidget {
  const CategoryItemReviewSummaryBody({
    super.key,
    required this.categoryItemEntity,
  });

  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const CategoryItemReviewSummaryAppBar(),
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: SliverReviewsAppBarDelegate(
              numOfRatings: categoryItemEntity.numOfRatings,
              starsCount: categoryItemEntity.starsCount,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            sliver: const SliverToBoxAdapter(
              child: WriteReviewBtn(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            sliver: const SliverToBoxAdapter(
              child: CategoryItemReviewsBuilder(),
            ),
          ),
        ],
      ),
    );
  }
}
