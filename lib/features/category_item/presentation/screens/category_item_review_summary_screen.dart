import 'package:flutter/material.dart';

import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/review_summary/category_item_review_summary_body.dart';

class CategoryItemReviewSummaryScreen extends StatelessWidget {
  const CategoryItemReviewSummaryScreen({
    super.key,
    required this.categoryItemEntity,
  });

  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      body: CategoryItemReviewSummaryBody(
        categoryItemEntity: categoryItemEntity,
      ),
    );
  }
}
