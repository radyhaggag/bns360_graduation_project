import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/assets/app_images.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../generated/l10n.dart';
import 'forgot_password_form.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppImages.forgotPassword,
              alignment: Alignment.center,
              width: context.width,
              height: context.height / 3,
            ),
            Text(
              S.of(context).forgotPassword,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text(
              S.of(context).forgotPasswordMsg,
              style: AppStyles.authScreensDetailsStyle(context),
            ),
            const SizedBox(height: 30),
            const ForgotPasswordForm(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
