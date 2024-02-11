import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../generated/l10n.dart';

class CategoryItemReviewSummaryAppBar extends StatelessWidget {
  const CategoryItemReviewSummaryAppBar({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Text(
        S.of(context).review_summary,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: AppFontSize.subTitle,
            ),
      ),
      centerTitle: false,
      primary: true,
      titleSpacing: 0.0,
      leading: const CustomBackButton(),
    );
  }
}
