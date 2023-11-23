import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/auth_bloc.dart';

class NotReceiveTile extends StatelessWidget {
  final String email;
  const NotReceiveTile({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          S.of(context).notReceiveCode,
          style: AppStyles.getMediumStyle(color: AppColors.black25),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            context.read<AuthBloc>().add(SendResetPasswordCodeEvent(
                  email: email,
                ));
          },
          child: Text(
            S.of(context).resend,
            style: AppStyles.getSemiBoldStyle(
              color: AppColors.primary,
              fontSize: AppFontSize.body,
            ),
          ),
        ),
      ],
    );
  }
}
