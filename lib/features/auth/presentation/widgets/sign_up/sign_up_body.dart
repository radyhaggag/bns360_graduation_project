import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.only(
        left: kHorizontalPadding,
        right: kHorizontalPadding,
        top: 25.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              S.of(context).createYourAccount,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              S.of(context).signUpMsg,
              style: AppStyles.authScreensDetailsStyle(context),
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
