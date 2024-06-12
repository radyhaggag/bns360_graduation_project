import '../../../../core/utils/extensions/context.dart';
import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/center_progress_indicator.dart';
import '../../../../core/widgets/messages/error_message_widget.dart';
import '../bloc/category_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/params/category_item_screen_params.dart';
import '../widgets/category_item_body.dart';

class CategoryItemScreen extends StatefulWidget {
  const CategoryItemScreen({
    super.key,
    required this.screenParams,
  });

  final CategoryItemScreenParams screenParams;

  @override
  State<CategoryItemScreen> createState() => _CategoryItemScreenState();
}

class _CategoryItemScreenState extends State<CategoryItemScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.screenParams.categoryItemEntity != null) {
      context.read<CategoryItemBloc>().add(
            SetCategoryItemEntityEvent(
              categoryItemEntity: widget.screenParams.categoryItemEntity!,
            ),
          );
    } else {
      context.read<CategoryItemBloc>().add(
            GetCategoryItemEvent(
              itemId: widget.screenParams.itemId,
            ),
          );
    }
    if (widget.screenParams.categoryItemEntity?.reviewSummary == null) {
      context.read<CategoryItemBloc>().add(
            GetCategoryItemReviewSummaryEvent(
              itemId: widget.screenParams.itemId,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryItemBloc, CategoryItemState>(
        buildWhen: (previous, current) {
          final states = [
            GetCategoryItemLoadingState,
            GetCategoryItemErrorState,
            GetCategoryItemSuccessState,
          ];
          return states.contains(current.runtimeType);
        },
        builder: (context, state) {
          final entity = widget.screenParams.categoryItemEntity;

          if (entity != null) {
            return CategoryItemBody(
              categoryItemEntity: entity,
            );
          }
          if (state is GetCategoryItemSuccessState) {
            return CategoryItemBody(
              categoryItemEntity: state.categoryItem,
            );
          } else if (state is GetCategoryItemLoadingState) {
            return FullScreenLoadingIndicator(
              color: context.theme.primaryColor,
            );
          } else if (state is GetCategoryItemErrorState) {
            return ErrorMessageWidget(
              message: state.message,
              height: context.height,
              width: context.width,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
