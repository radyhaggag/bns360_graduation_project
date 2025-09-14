import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/extensions/context.dart';

class SettingsItemTile extends StatelessWidget {
  const SettingsItemTile({
    super.key,
    required this.title,
    this.icon,
    this.svgPath,
    this.isSvg = true,
    this.trailing,
    this.onTap,
  });

  final IconData? icon;
  final String? svgPath;
  final String title;
  final bool isSvg;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: context.theme.listTileTheme.tileColor,
      leading: (isSvg && svgPath != null)
          ? SvgPicture.asset(
              svgPath!,
              colorFilter: ColorFilter.mode(
                _mainColor(context),
                BlendMode.srcIn,
              ),
            )
          : Icon(
              icon,
              color: _mainColor(context),
              size: 24.r,
            ),
      title: Text(
        title,
        style: context.textTheme.bodyLarge?.copyWith(
          fontSize: AppFontSize.details,
          color: _mainColor(context),
        ),
      ),
      trailing: trailing ??
          Icon(
            Icons.arrow_forward_ios,
            color: _mainColor(context),
          ),
    );
  }

  Color _mainColor(BuildContext context) {
    return context.theme.cardColor;
  }
}
