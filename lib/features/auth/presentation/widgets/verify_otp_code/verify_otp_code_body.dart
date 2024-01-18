import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';
import 'verify_otp_code_form.dart';

class VerifyOtpCodeBody extends StatelessWidget {
  final String email;
  const VerifyOtpCodeBody({super.key, required this.email});

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
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "${S.of(context).sentCodeTo} $email",
              style: AppStyles.authScreensDetailsStyle(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            VerifyOtpCodeForm(email: email),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
