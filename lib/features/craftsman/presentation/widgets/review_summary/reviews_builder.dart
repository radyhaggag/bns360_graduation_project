import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/media_query.dart';
import '../../../../../core/widgets/center_progress_indicator.dart';
import '../../../../../core/widgets/data_state_widget.dart';
import '../../../../../core/widgets/reviews/review_widget/review_widget.dart';
import '../../bloc/craftsman_bloc.dart';

class CraftsmanReviewsBuilder extends StatefulWidget {
  const CraftsmanReviewsBuilder({super.key});

  @override
  State<CraftsmanReviewsBuilder> createState() =>
      _CraftsmanReviewsBuilderState();
}

class _CraftsmanReviewsBuilderState extends State<CraftsmanReviewsBuilder> {
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
    return BlocBuilder<CraftsmanBloc, CraftsmanState>(
      builder: (context, state) {
        final errorMsg =
            (state is GetCraftsmanReviewsErrorState) ? state.message : null;
        return DataStateWidget(
          isLoading: state is GetCraftsmanReviewsLoadingState,
          isError: state is GetCraftsmanReviewsErrorState,
          isLoaded: state is GetCraftsmanReviewsSuccessState,
          errorMessage: errorMsg,
          errorMsgBackground: Colors.transparent,
          loadingWidget: FullScreenLoadingIndicator(
            color: Theme.of(context).cardColor,
            height: context.height / 2,
          ),
          loadedWidget: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            controller: scrollController,
            child: Column(
              children: List.generate(
                  context.read<CraftsmanBloc>().reviews.length, (index) {
                final item = context.read<CraftsmanBloc>().reviews[index];

                return ReviewWidget(review: item);
              }),
            ),
          ),
        );
      },
    );
  }
}
