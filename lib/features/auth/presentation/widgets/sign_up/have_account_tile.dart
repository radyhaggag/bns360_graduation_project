import 'package:flutter/material.dart';

import '../../../../../config/route_config.dart';
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
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).hintColor,
              ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            Routes.login,
          ),
          child: Text(
            S.of(context).login,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).cardColor,
                ),
          ),
        ),
      ],
    );
  }
}
