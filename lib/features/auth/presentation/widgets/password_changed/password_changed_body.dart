import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/assets/app_images.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';

class PasswordChangedBody extends StatelessWidget {
  const PasswordChangedBody({
    super.key,
  });

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
            Image.asset(AppImages.success),
            const SizedBox(height: 50),
            Text(
              S.of(context).passwordChanged,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text(
              S.of(context).passwordChangedMsg,
              style: AppStyles.authScreensDetailsStyle(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),
            CustomElevatedButton(
              label: S.of(context).backToLogin,
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.login,
                  (route) => false,
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
