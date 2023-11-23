import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';
import 'verify_reset_password_code_form.dart';

class VerifyResetPasswordCodeBody extends StatelessWidget {
  final String email;
  const VerifyResetPasswordCodeBody({super.key, required this.email});

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
              S.of(context).checkEmailMsg,
              style: AppStyles.getSemiBoldStyle(
                fontSize: AppFontSize.title,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${S.of(context).sentCodeTo} $email",
              style: AppStyles.getCaptionsStyle(
                fontSize: AppFontSize.body,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            VerifyResetPasswordCodeForm(email: email),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
