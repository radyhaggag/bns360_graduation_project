import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_fonts.dart';

class ProfileItemTile extends StatelessWidget {
  const ProfileItemTile({
    super.key,
    required this.title,
    this.icon,
    this.svgPath,
    this.isSvg = true,
    this.trailing,
    this.onTap,
    this.size,
  });

  final IconData? icon;
  final String? svgPath;
  final String title;
  final bool isSvg;
  final Widget? trailing;
  final void Function()? onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: context.theme.listTileTheme.tileColor,
      leading: (isSvg && svgPath != null)
          ? SvgPicture.asset(
              svgPath!,
              color: _iconColor(context),
              height: size,
              width: size,
            )
          : Icon(
              icon,
              color: _iconColor(context),
              size: size ?? 24.r,
            ),
      title: Text(
        title,
        style: context.textTheme.titleSmall?.copyWith(
          fontSize: AppFontSize.details,
          color: context.theme.cardColor,
        ),
      ),
      trailing: trailing ??
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.primary,
          ),
    );
  }

  Color _iconColor(BuildContext context) {
    return context.theme.primaryColor.withAlpha(90);
  }
}

class LogoutTile extends StatelessWidget {
  const LogoutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      tileColor: context.theme.listTileTheme.tileColor,
      leading: RotatedBox(
        quarterTurns: 2,
        child: Icon(
          Icons.logout,
          color: context.theme.primaryColor.withAlpha(90),
          size: 24.r,
        ),
      ),
      title: Text(
        S.of(context).logout,
        style: context.textTheme.titleSmall?.copyWith(
          fontSize: AppFontSize.details,
          color: context.theme.cardColor,
        ),
      ),
    );
  }
}
