import 'package:flutter/widgets.dart';

import '../../../../../core/extensions/media_query.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/constants.dart';
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
              AppAssets.forgotPassword,
              alignment: Alignment.center,
              width: context.width,
              height: context.height / 3,
            ),
            Text(
              S.of(context).forgotPassword,
              style: AppStyles.getSemiBoldStyle(
                fontSize: AppFontSize.title,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              S.of(context).forgotPasswordMsg,
              style: AppStyles.getCaptionsStyle(
                fontSize: AppFontSize.body,
                color: AppColors.black.withOpacity(.7),
              ),
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
