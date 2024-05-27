import 'package:bns360_graduation_project/core/helpers/custom_toast.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/write_review_btn.dart';
import 'package:bns360_graduation_project/features/craftsman/presentation/bloc/craftsman_bloc.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/reviews/add_review_bottom_sheet/add_review_bottom_sheet.dart';

class SendCraftsmanReviewSection extends StatelessWidget {
  const SendCraftsmanReviewSection({
    super.key,
    required this.itemId,
    this.refreshReviewsAfterSend = false,
  });

  final int itemId;

  final bool refreshReviewsAfterSend;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CraftsmanBloc, CraftsmanState>(
      listener: (context, state) {
        if (state is SendCraftsmanReviewSuccessState) {
          showToast(
            S.of(context).review_sent_successfully,
            ToastType.success,
          );

          if (refreshReviewsAfterSend) {
            context.read<CraftsmanBloc>().add(GetCraftsmanReviewsEvent(
                  itemId: itemId,
                ));
          }
        }
        if (state is SendCraftsmanReviewErrorState) {
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
          isLoading: state is SendCraftsmanReviewLoadingState,
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
    context.read<CraftsmanBloc>().add(
          SendCraftsmanReviewEvent(
            itemId: itemId,
            rating: rating,
            review: review,
          ),
        );
  }
}
