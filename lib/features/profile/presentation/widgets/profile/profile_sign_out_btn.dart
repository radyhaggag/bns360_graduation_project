import 'package:bns360_graduation_project/config/route_config.dart';
import 'package:bns360_graduation_project/core/providers/app_provider.dart';
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
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is SignOutSuccessState) {
          if (state.isGuest) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.login,
              (route) => false,
            );
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.welcome,
              (route) => false,
            );
          }
        }
      },
      child: ListTile(
        onTap: () {
          if (AppProvider().isGuest) {
            context.read<ProfileBloc>().add(SignOutEvent());
            return;
          }
          ConfirmationDialog.show(
            context,
            message: S.of(context).logout_message,
            confirmLabel: S.of(context).logout,
            onConfirm: () {
              context.read<ProfileBloc>().add(SignOutEvent());
            },
          );
        },
        tileColor: context.theme.listTileTheme.tileColor,
        leading: RotatedBox(
          quarterTurns: 2,
          child: Icon(
            AppProvider().isGuest ? Icons.login : Icons.logout,
            color: context.theme.primaryColor.withAlpha(90),
            size: 25.r,
          ),
        ),
        title: Text(
          AppProvider().isGuest ? S.of(context).login : S.of(context).logout,
          style: context.textTheme.titleSmall?.copyWith(
            fontSize: AppFontSize.details,
            color: context.theme.cardColor,
          ),
        ),
      ),
    );
  }
}
