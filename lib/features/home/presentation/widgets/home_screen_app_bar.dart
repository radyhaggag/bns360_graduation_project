import 'package:bns360_graduation_project/core/utils/app_fonts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../core/widgets/icons/profile_circle_icon.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        S.of(context).appName,
        style: AppStyles.getBoldStyle(
          color: AppColors.primary,
          fontSize: AppFontSize.title,
        ).copyWith(letterSpacing: 1),
      ),
      shape: Border(
        bottom: BorderSide(color: AppColors.black25, width: 2.5),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            FeatherIcons.messageCircle,
            size: 30,
          ),
          onPressed: () {},
          style: IconButton.styleFrom(
            foregroundColor: AppColors.primary,
          ),
        ),
        IconButton(
          icon: const ProfileCircleIcon(),
          onPressed: () {},
          style: IconButton.styleFrom(
            foregroundColor: AppColors.primary,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
