import 'package:flutter/material.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/extensions/language.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../generated/l10n.dart';

class ForgotPasswordBtn extends StatelessWidget {
  const ForgotPasswordBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(Routes.forgotPassword),
      child: Align(
        alignment: context.currentLanguage == Language.english
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Text(
          S.of(context).forgotPassword,
          style: AppStyles.getMediumStyle(color: AppColors.black25),
        ),
      ),
    );
  }
}
