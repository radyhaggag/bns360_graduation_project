import 'package:bns360_graduation_project/core/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../generated/l10n.dart';

class CategoryItemDescription extends StatelessWidget {
  const CategoryItemDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: kHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).listTileTheme.tileColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: _DescriptionWidget(
        description: description,
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).description,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).cardColor,
                fontSize: AppFontSize.details,
              ),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).primaryColor.withOpacity(.5),
                fontSize: AppFontSize.details,
              ),
        ),
      ],
    );
  }
}
