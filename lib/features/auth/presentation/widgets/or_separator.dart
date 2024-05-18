import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../generated/l10n.dart';

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              color: AppColors.light,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            S.of(context).or,
            style: context.textTheme.titleSmall?.copyWith(
              color: context.theme.hintColor,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              color: AppColors.light,
            ),
          ),
        ),
      ],
    );
  }
}
