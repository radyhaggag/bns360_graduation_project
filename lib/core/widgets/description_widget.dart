import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/app_fonts.dart';
import '../utils/extensions/context.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.theme.highlightColor,
      ),
      width: context.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).description,
            style: context.textTheme.titleSmall?.copyWith(
              fontSize: AppFontSize.details,
              color: context.theme.cardColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: AppFontSize.light,
              color: context.theme.primaryColor.withOpacity(.6),
            ),
          ),
        ],
      ),
    );
  }
}
