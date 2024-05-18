import 'package:flutter/material.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../generated/l10n.dart';

class HaveAccountTile extends StatelessWidget {
  const HaveAccountTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).haveAccountMsg,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.theme.hintColor,
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            Routes.login,
          ),
          child: Text(
            S.of(context).login,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.theme.cardColor,
            ),
          ),
        ),
      ],
    );
  }
}
