import '../../../../config/route_config.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../core/widgets/center_progress_indicator.dart';
import '../bloc/category_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/messages/error_message_widget.dart';
import '../../../../../core/widgets/reviews/main_review_summary_card/main_review_summary_card.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';

class CategoryItemReviewSummarySection extends StatelessWidget {
  const CategoryItemReviewSummarySection({
    super.key,
    required this.showViewAllBtn,
  });

  final bool showViewAllBtn;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryItemBloc, CategoryItemState>(
      builder: (context, state) {
        final categoryItem = getCategoryItem(context);

        if (state is GetCategoryItemReviewSummaryLoadingState) {
          return const CenterProgressIndicator();
        }

        if (state is GetCategoryItemReviewSummaryErrorState) {
          return ErrorMessageWidget(
            message: state.message,
            addBackButton: true,
          );
        }

        if (state is GetCategoryItemReviewSummarySuccessState ||
            categoryItem?.reviewSummary != null) {
          return MainReviewSummaryCard(
            numOfRatings: categoryItem!.reviewSummary!.totalReviews.toInt(),
            starsCount: categoryItem.reviewSummary!.averageRating,
            mainColor: context.theme.listTileTheme.tileColor,
            fiveStarCount: categoryItem.reviewSummary!.fiveStars,
            fourStarCount: categoryItem.reviewSummary!.fourStars,
            threeStarCount: categoryItem.reviewSummary!.threeStars,
            twoStarCount: categoryItem.reviewSummary!.twoStars,
            oneStarCount: categoryItem.reviewSummary!.oneStars,
            showViewAllBtn: showViewAllBtn,
            onViewAllTap: () {
              Navigator.of(context).pushNamed(
                Routes.categoryItemReviewSummary,
                arguments: categoryItem,
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  CategoryItemEntity? getCategoryItem(BuildContext context) {
    final categoryItem = context.read<CategoryItemBloc>().categoryItem;
    final reviewSummary = context.read<CategoryItemBloc>().reviewsSummary;

    if (reviewSummary != null) {
      return categoryItem?.copyWith(
        reviewSummary: reviewSummary,
      );
    }
    {
      return categoryItem;
    }
  }
}
