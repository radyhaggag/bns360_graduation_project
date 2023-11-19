import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/extensions/language.dart';
import '../../../../../core/extensions/media_query.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../or_separator.dart';
import '../social_icons_buttons.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 25,
      ),
      child: Column(
        children: [
          Align(
            alignment: context.currentLanguage == Language.english
                ? Alignment.topLeft
                : Alignment.topRight,
            child: Text(
              S.of(context).welcome,
              style: AppStyles.getBoldStyle(color: AppColors.primary),
            ),
          ),
          SizedBox(height: 30.h),
          Image.asset(
            AppAssets.welcomeVector,
            width: context.width,
            height: context.height / 3,
          ),
          SizedBox(height: 30.h),
          CustomElevatedButton(
            onPressed: () => Navigator.of(context).popAndPushNamed(
              Routes.login,
            ),
            label: S.of(context).login,
          ),
          SizedBox(height: 15.h),
          CustomOutlinedButton(
            onPressed: () => Navigator.of(context).popAndPushNamed(
              Routes.signUp,
            ),
            label: S.of(context).signUp,
          ),
          SizedBox(height: 15.h),
          CustomTextButton(
            onPressed: () => Navigator.of(context).popAndPushNamed(
              Routes.home,
            ),
            label: S.of(context).continueAsGuest,
          ),
          SizedBox(height: 20.h),
          const OrSeparator(),
          const SocialIconsButtons(),
        ],
      ),
    );
  }
}
