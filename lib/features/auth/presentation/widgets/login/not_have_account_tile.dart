import 'package:flutter/material.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';

class NotHaveAccountTile extends StatelessWidget {
  const NotHaveAccountTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).notHaveAccountMsg,
          style: AppStyles.getMediumStyle(color: AppColors.black25),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            Routes.signUp,
          ),
          child: Text(
            S.of(context).signUp,
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
