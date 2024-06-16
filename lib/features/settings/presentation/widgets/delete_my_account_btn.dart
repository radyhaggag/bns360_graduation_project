import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_config.dart';
import '../../../../core/app/app_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../core/widgets/confirm_delete_pop_up.dart';
import '../../../../generated/l10n.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';

class DeleteAccountBtn extends StatelessWidget {
  const DeleteAccountBtn({super.key});

  @override
  Widget build(BuildContext context) {
    if (AppProvider().isGuest) return const SizedBox.shrink();

    return ListTile(
      onTap: () {
        ConfirmationDialog.show(
          context,
          onConfirm: () {
            context.read<ProfileBloc>().add(DeleteAccountEvent());
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.login,
              (route) => false,
            );
          },
          message: S.of(context).delete_account_message,
        );
      },
      tileColor: context.read<AppBloc>().state.theme == AppTheme.light
          ? AppColors.white
          : AppColors.black,
      title: Text(
        S.of(context).delete_account,
        style: context.textTheme.bodyLarge?.copyWith(
          fontSize: AppFontSize.details,
          color: _mainColor(context),
        ),
      ),
      trailing: Icon(
        Icons.delete,
        color: _mainColor(context),
      ),
    );
  }

  Color _mainColor(BuildContext context) {
    return AppColors.error;
  }
}
