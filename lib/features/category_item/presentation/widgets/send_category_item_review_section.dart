import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/custom_toast.dart';
import '../../../../core/widgets/buttons/write_review_btn.dart';
import '../../../../core/widgets/reviews/add_review_bottom_sheet/add_review_bottom_sheet.dart';
import '../../../../generated/l10n.dart';
import '../bloc/category_item_bloc.dart';

class SendCategoryItemReviewSection extends StatelessWidget {
  const SendCategoryItemReviewSection({
    super.key,
    required this.itemId,
    this.refreshReviewsAfterSend = false,
  });

  final int itemId;

  final bool refreshReviewsAfterSend;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryItemBloc, CategoryItemState>(
      listener: (context, state) {
        if (state is SendCategoryItemReviewSuccessState) {
          showToast(
            S.of(context).review_sent_successfully,
            ToastType.success,
          );

          if (refreshReviewsAfterSend) {
            context.read<CategoryItemBloc>().add(GetCategoryItemReviewsEvent(
                  itemId: itemId,
                ));
          }
        }
        if (state is SendCategoryItemReviewErrorState) {
          showToast(state.message, ToastType.error);

          AddReviewBottomSheet.show(
            context: context,
            initialRating: state.rating,
            initialReview: state.review,
            addReviewCallback: (rating, value) => _addReviewCallback(
              context,
              rating: rating,
              review: value,
            ),
          );
        }
      },
      builder: (context, state) {
        return WriteReviewBtn(
          isLoading: state is SendCategoryItemReviewLoadingState,
          addReviewCallback: (rating, value) => _addReviewCallback(
            context,
            rating: rating,
            review: value,
          ),
        );
      },
    );
  }

  void _addReviewCallback(
    BuildContext context, {
    required double rating,
    required String review,
  }) {
    context.read<CategoryItemBloc>().add(
          SendReviewEvent(
            itemId: itemId,
            rating: rating,
            review: review,
            fetchReviews: refreshReviewsAfterSend,
          ),
        );
  }
}
