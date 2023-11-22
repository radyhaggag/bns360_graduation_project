import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';
import 'have_account_tile.dart';
import 'sign_up_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

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
            const SizedBox(height: 50),
            Text(
              S.of(context).createYourAccount,
              style: AppStyles.getBoldStyle(color: AppColors.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              S.of(context).signUpMsg,
              style: AppStyles.getMediumStyle(
                color: AppColors.black25,
                fontSize: AppFontSize.details,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const SignUpForm(),
            const SizedBox(height: 20),
            const HaveAccountTile(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
