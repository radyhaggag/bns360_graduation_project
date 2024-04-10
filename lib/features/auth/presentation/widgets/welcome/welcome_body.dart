import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/features/auth/presentation/widgets/welcome/continue_as_guest_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/utils/assets/app_images.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/extensions/language.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../or_separator.dart';
import '../social_icons_buttons.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: kHorizontalPadding,
        right: kHorizontalPadding,
        top: 50.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: context.currentLanguage == Language.english
                  ? Alignment.topLeft
                  : Alignment.topRight,
              child: Text(
                S.of(context).welcome,
                style: context.textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 30),
            Image.asset(
              AppImages.welcomeVector,
              width: context.width,
              height: context.height / 3,
            ),
            const SizedBox(height: 30),
            CustomElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(
                Routes.login,
              ),
              label: S.of(context).login,
            ),
            const SizedBox(height: 15),
            CustomOutlinedButton(
              onPressed: () => Navigator.of(context).pushNamed(
                Routes.signUp,
              ),
              label: S.of(context).signUp,
            ),
            const SizedBox(height: 15),
            const ContinueAsGuestButton(),
            const SizedBox(height: 10),
            const OrSeparator(),
            const SocialIconsButtons(),
          ],
        ),
      ),
    );
  }
}
