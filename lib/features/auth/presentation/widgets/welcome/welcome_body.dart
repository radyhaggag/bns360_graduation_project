import 'package:flutter/material.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/extensions/language.dart';
import '../../../../../core/extensions/media_query.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/constants.dart';
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
        horizontal: kHorizontalPadding,
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
          const SizedBox(height: 30),
          Image.asset(
            AppAssets.welcomeVector,
            width: context.width,
            height: context.height / 2.4,
          ),
          const SizedBox(height: 30),
          CustomElevatedButton(
            onPressed: () => Navigator.of(context).popAndPushNamed(
              Routes.login,
            ),
            label: S.of(context).login,
          ),
          const SizedBox(height: 15),
          CustomOutlinedButton(
            onPressed: () => Navigator.of(context).popAndPushNamed(
              Routes.signUp,
            ),
            label: S.of(context).signUp,
          ),
          const SizedBox(height: 15),
          CustomTextButton(
            onPressed: () => Navigator.of(context).popAndPushNamed(
              Routes.home,
            ),
            label: S.of(context).continueAsGuest,
          ),
          const SizedBox(height: 10),
          const OrSeparator(),
          const SocialIconsButtons(),
        ],
      ),
    );
  }
}
