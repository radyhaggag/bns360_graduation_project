import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../generated/l10n.dart';

class CraftsmanReviewSummaryAppBar extends StatelessWidget {
  const CraftsmanReviewSummaryAppBar({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: context.theme.appBarTheme.backgroundColor,
      title: Text(
        S.of(context).review_summary,
        style: context.textTheme.titleMedium?.copyWith(
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
