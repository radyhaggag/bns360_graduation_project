import 'package:bns360_graduation_project/core/helpers/custom_toast.dart';
import 'package:bns360_graduation_project/core/widgets/confirm_delete_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_config.dart';
import '../../../../core/app/app_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../generated/l10n.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';

class SettingsSignOutBtn extends StatelessWidget {
  const SettingsSignOutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is SignOutSuccessState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.login,
            (route) => false,
          );
        }

        if (state is SignOutErrorState) {
          showToast(state.message, ToastType.error);
        }
      },
      child: ListTile(
        onTap: () {
          ConfirmationDialog.show(
            context,
            message: S.of(context).logout_message,
            onConfirm: () {
              context.read<ProfileBloc>().add(SignOutEvent());
            },
          );
        },
        tileColor: context.read<AppBloc>().state.theme == AppTheme.light
            ? AppColors.white
            : AppColors.black,
        title: Text(
          S.of(context).logout,
          style: context.textTheme.bodyLarge?.copyWith(
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
      ),
    );
  }

  Color _mainColor(BuildContext context) {
    return context.theme.cardColor;
  }
}
