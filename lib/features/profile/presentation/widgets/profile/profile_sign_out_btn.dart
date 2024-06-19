import 'package:bns360_graduation_project/config/route_config.dart';
import 'package:bns360_graduation_project/core/widgets/confirm_delete_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/profile_bloc.dart';

class ProfileSignOutBtn extends StatelessWidget {
  const ProfileSignOutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        ConfirmationDialog.show(
          context,
          message: S.of(context).logout_message,
          confirmLabel: S.of(context).logout,
          onConfirm: () {
            context.read<ProfileBloc>().add(SignOutEvent());
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.login,
              (route) => false,
            );
          },
        );
      },
      tileColor: context.theme.listTileTheme.tileColor,
      leading: RotatedBox(
        quarterTurns: 2,
        child: Icon(
          Icons.logout,
          color: context.theme.primaryColor.withAlpha(90),
          size: 25.r,
        ),
      ),
      title: Text(
        S.of(context).logout,
        style: context.textTheme.titleSmall?.copyWith(
          fontSize: AppFontSize.details,
          color: context.theme.cardColor,
        ),
      ),
    );
  }
}
