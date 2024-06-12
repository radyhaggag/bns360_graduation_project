import '../../../../config/route_config.dart';
import '../../../../core/shared_data/entities/review_summary_entity.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../core/widgets/center_progress_indicator.dart';
import '../bloc/craftsman_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/messages/error_message_widget.dart';
import '../../../../../core/widgets/reviews/main_review_summary_card/main_review_summary_card.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';

class CraftsmanReviewSummarySection extends StatelessWidget {
  const CraftsmanReviewSummarySection({
    super.key,
    required this.showViewAllBtn,
  });

  final bool showViewAllBtn;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CraftsmanBloc, CraftsmanState>(
      builder: (context, state) {
        final craftsman = getCraftsman(context);

        if (state is GetCraftsmanReviewSummaryLoadingState) {
          return const CenterProgressIndicator();
        }

        if (state is GetCraftsmanReviewSummaryErrorState) {
          return ErrorMessageWidget(
            message: state.message,
            addBackButton: true,
          );
        }

        if (state is GetCraftsmanReviewSummarySuccessState ||
            craftsman?.reviewSummary != null) {
          return MainReviewSummaryCard(
            numOfRatings: craftsman!.reviewSummary!.totalReviews.toInt(),
            starsCount: craftsman.reviewSummary!.averageRating,
            mainColor: context.theme.listTileTheme.tileColor,
            fiveStarCount: craftsman.reviewSummary!.fiveStars,
            fourStarCount: craftsman.reviewSummary!.fourStars,
            threeStarCount: craftsman.reviewSummary!.threeStars,
            twoStarCount: craftsman.reviewSummary!.twoStars,
            oneStarCount: craftsman.reviewSummary!.oneStars,
            showViewAllBtn: showViewAllBtn,
            onViewAllTap: () {
              Navigator.of(context).pushNamed(
                Routes.craftsmanReviewSummary,
                arguments: craftsman,
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  CraftsmanEntity? getCraftsman(BuildContext context) {
    final craftsman = context.read<CraftsmanBloc>().craftsman;
    final reviewSummary = context.read<CraftsmanBloc>().reviewsSummary;

    if (reviewSummary != null) {
      return craftsman?.copyWith(reviewSummary: reviewSummary);
    } else if (reviewSummary == null && craftsman?.reviewSummary == null) {
      return craftsman?.copyWith(
        reviewSummary: const ReviewSummaryEntity.empty(),
      );
    }
    return craftsman;
  }
}
