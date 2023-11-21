import 'package:flutter/material.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';

class HaveAccountTile extends StatelessWidget {
  const HaveAccountTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).haveAccountMsg,
          style: AppStyles.getMediumStyle(color: AppColors.black25),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () => Navigator.of(context).popAndPushNamed(
            Routes.login,
          ),
          child: Text(
            S.of(context).login,
            style: AppStyles.getSemiBoldStyle(
              color: AppColors.primary,
              fontSize: AppFontSize.body,
            ),
          ),
        ),
      ],
    );
  }
}
