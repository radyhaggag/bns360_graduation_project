import 'package:flutter/material.dart';

import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/review_summary/craftsman_review_summary_body.dart';

class CraftsmanReviewSummaryScreen extends StatelessWidget {
  const CraftsmanReviewSummaryScreen({
    super.key,
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      body: CraftsmanReviewSummaryBody(
        craftsmanEntity: craftsmanEntity,
      ),
    );
  }
}
