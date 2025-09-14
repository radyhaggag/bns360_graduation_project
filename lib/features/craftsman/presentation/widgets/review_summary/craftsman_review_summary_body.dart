import 'package:bns360_graduation_project/features/craftsman/presentation/bloc/craftsman_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../../core/shared_data/entities/review_summary_entity.dart';
import '../../../../../core/widgets/reviews/sliver_reviews_app_bar_delegate.dart';
import '../send_craftsman_review_section.dart';
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
          BlocBuilder<CraftsmanBloc, CraftsmanState>(
            builder: (context, state) {
              final reviewSummary =
                  context.read<CraftsmanBloc>().reviewsSummary ??
                      craftsmanEntity.reviewSummary;

              return SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: SliverReviewsAppBarDelegate(
                  reviewSummary:
                      reviewSummary ?? const ReviewSummaryEntity.empty(),
                ),
              );
            },
          ),
          if (!craftsmanEntity.isBelongToMe)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              sliver: SliverToBoxAdapter(
                child: SendCraftsmanReviewSection(
                  itemId: craftsmanEntity.id,
                  refreshReviewsAfterSend: true,
                ),
              ),
            ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            sliver: SliverToBoxAdapter(
              child: CraftsmanReviewsBuilder(
                craftsmanId: craftsmanEntity.id,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
