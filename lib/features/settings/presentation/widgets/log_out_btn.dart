import '../../../../core/app/app_bloc.dart';
import '../../../../core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../generated/l10n.dart';

class LogOutBtn extends StatelessWidget {
  const LogOutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      tileColor: context.read<AppBloc>().state.theme == AppTheme.light
          ? AppColors.white
          : AppColors.black,
      title: Text(
        S.of(context).logout,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: AppFontSize.details,
              color: _mainColor(context),
            ),
      ),
      trailing: RotatedBox(
        quarterTurns: 2,
        child: Icon(
          Icons.logout,
          color: _mainColor(context),
        ),
      ),
    );
  }

  Color _mainColor(context) {
    return Theme.of(context).cardColor;
  }
}
