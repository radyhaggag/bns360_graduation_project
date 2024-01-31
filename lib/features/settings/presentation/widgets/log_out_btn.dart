import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../generated/l10n.dart';

class LogOutBtn extends StatelessWidget {
  const LogOutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      tileColor: AppColors.white,
      title: Text(
        S.of(context).logout,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: AppFontSize.details,
              color: _mainColor,
            ),
      ),
      trailing: RotatedBox(
        quarterTurns: 2,
        child: Icon(
          Icons.logout,
          color: _mainColor,
        ),
      ),
    );
  }

  Color get _mainColor => AppColors.primary;
}
