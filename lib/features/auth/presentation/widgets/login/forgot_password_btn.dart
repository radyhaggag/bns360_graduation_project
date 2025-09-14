import 'package:flutter/material.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/language.dart';
import '../../../../../generated/l10n.dart';

class ForgotPasswordBtn extends StatelessWidget {
  const ForgotPasswordBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: context.currentLanguage == Language.english
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(Routes.forgotPassword),
        child: Text(
          S.of(context).forgotPassword,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.theme.hintColor,
          ),
        ),
      ),
    );
  }
}
