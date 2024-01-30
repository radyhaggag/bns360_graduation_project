import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';

class SettingsItemTile extends StatelessWidget {
  const SettingsItemTile({
    super.key,
    required this.title,
    this.icon,
    this.svgPath,
    this.isSvg = true,
    this.trailing,
  });

  final IconData? icon;
  final String? svgPath;
  final String title;
  final bool isSvg;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: (isSvg && svgPath != null)
          ? SvgPicture.asset(svgPath!)
          : Icon(
              icon,
              color: _mainColor,
              size: 24.r,
            ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: AppFontSize.details,
              color: _mainColor,
            ),
      ),
      trailing: trailing ??
          Icon(
            Icons.arrow_forward_ios,
            color: _mainColor,
          ),
    );
  }

  Color get _mainColor {
    return AppColors.black.withOpacity(.4);
  }
}
