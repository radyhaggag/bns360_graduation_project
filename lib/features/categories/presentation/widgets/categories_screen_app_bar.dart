import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/media_query.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class CategoriesScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CategoriesScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(15),
      child: Text(
        S.of(context).categories,
        style: AppStyles.getBoldStyle(
          fontSize: AppFontSize.title,
          color: AppColors.primary,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
