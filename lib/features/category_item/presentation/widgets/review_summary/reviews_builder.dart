import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/center_progress_indicator.dart';
import '../../../../../core/widgets/data_state_widget.dart';
import '../../../../../core/widgets/reviews/review_widget/review_widget.dart';
import '../../bloc/category_item_bloc.dart';

class CategoryItemReviewsBuilder extends StatefulWidget {
  const CategoryItemReviewsBuilder({super.key});

  @override
  State<CategoryItemReviewsBuilder> createState() =>
      _CategoryItemReviewsBuilderState();
}

class _CategoryItemReviewsBuilderState
    extends State<CategoryItemReviewsBuilder> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryItemBloc, CategoryItemState>(
      builder: (context, state) {
        final errorMsg =
            (state is GetCategoryItemReviewsErrorState) ? state.message : null;
        return DataStateWidget(
          isLoading: state is GetCategoryItemReviewsLoadingState,
          isError: state is GetCategoryItemReviewsErrorState,
          isLoaded: state is GetCategoryItemReviewsSuccessState,
          errorMessage: errorMsg,
          errorMsgBackground: Colors.transparent,
          loadingWidget: FullScreenLoadingIndicator(
            color: context.theme.cardColor,
            height: context.height / 2,
          ),
          loadedWidget: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            controller: scrollController,
            child: Column(
              children: List.generate(
                context.read<CategoryItemBloc>().reviews.length,
                (index) {
                  final item = context.read<CategoryItemBloc>().reviews[index];

                  return ReviewWidget(review: item);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
