import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';
import '../or_separator.dart';
import '../social_icons_buttons.dart';
import 'login_form.dart';
import 'not_have_account_tile.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

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
            const SizedBox(height: 120),
            Text(
              S.of(context).loginMsg,
              style: AppStyles.getBoldStyle(color: AppColors.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            const LoginForm(),
            const SizedBox(height: 20),
            const NotHaveAccountTile(),
            const SizedBox(height: 30),
            const OrSeparator(),
            const SizedBox(height: 15),
            const SocialIconsButtons(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
