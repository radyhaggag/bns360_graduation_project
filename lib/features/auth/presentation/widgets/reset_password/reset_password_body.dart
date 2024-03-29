import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

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
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text(
              S.of(context).resetPasswordMsg,
              style: AppStyles.authScreensDetailsStyle(context),
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
