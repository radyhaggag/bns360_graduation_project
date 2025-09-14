import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/extensions/context.dart';

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
              colorFilter: ColorFilter.mode(
                _iconColor(context),
                BlendMode.srcIn,
              ),
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
          Icon(
            Icons.arrow_forward_ios,
            color: context.theme.cardColor,
          ),
    );
  }

  Color _iconColor(BuildContext context) {
    return context.theme.primaryColor.withAlpha(90);
  }
}
