import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';
import 'reset_password_form.dart';

class ResetPasswordBody extends StatelessWidget {
  final String email;

  const ResetPasswordBody({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Text(
              S.of(context).resetPassword,
              style: AppStyles.getSemiBoldStyle(
                fontSize: AppFontSize.title,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              S.of(context).resetPasswordMsg,
              style: AppStyles.getCaptionsStyle(
                fontSize: AppFontSize.body,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 50),
            ResetPasswordForm(email: email),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
