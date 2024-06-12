import '../../../../../core/shared_data/entities/review_summary_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../../core/widgets/reviews/sliver_reviews_app_bar_delegate.dart';
import '../send_category_item_review_section.dart';
import 'category_item_review_summary_app_bar.dart';
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
              reviewSummary: categoryItemEntity.reviewSummary ??
                  const ReviewSummaryEntity.empty(),
            ),
          ),
          if (!categoryItemEntity.isBelongToMe)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              sliver: SliverToBoxAdapter(
                child: SendCategoryItemReviewSection(
                  itemId: categoryItemEntity.id,
                  refreshReviewsAfterSend: true,
                ),
              ),
            ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            sliver: SliverToBoxAdapter(
              child: CategoryItemReviewsBuilder(
                categoryItemId: categoryItemEntity.id,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
