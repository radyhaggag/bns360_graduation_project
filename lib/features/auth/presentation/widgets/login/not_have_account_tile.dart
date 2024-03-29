import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../../config/route_config.dart';
import '../../../../../generated/l10n.dart';

class NotHaveAccountTile extends StatelessWidget {
  const NotHaveAccountTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).notHaveAccountMsg,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.theme.hintColor,
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            Routes.signUp,
          ),
          child: Text(
            S.of(context).signUp,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.theme.cardColor,
            ),
          ),
        ),
      ],
    );
  }
}
