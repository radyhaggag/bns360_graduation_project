import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/assets/app_svg.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({
    super.key,
    this.title,
    this.subtitle,
    this.mainAxisSize = MainAxisSize.max,
    this.icon,
    this.iconSize,
    this.iconPath,
    this.iconColor,
    this.showIcon = true,
  });

  final String? title;
  final String? subtitle;
  final MainAxisSize mainAxisSize;
  final Widget? icon;
  final double? iconSize;
  final String? iconPath;
  final Color? iconColor;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: mainAxisSize,
        children: [
          if (showIcon)
            icon ??
                _BuildEmptyListIcon(
                  iconPath: iconPath,
                  iconSize: iconSize,
                  iconColor: iconColor,
                ),
          SizedBox(
            height: 10.h,
          ),
          _BuildTitle(title: title),
          SizedBox(
            height: 10.h,
          ),
          _BuildSubtitle(subtitle: subtitle),
        ]);
  }
}

class _BuildTitle extends StatelessWidget {
  const _BuildTitle({
    required this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}

class _BuildSubtitle extends StatelessWidget {
  const _BuildSubtitle({
    required this.subtitle,
  });

  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle ?? '',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).primaryColor,
          ),
      textAlign: TextAlign.center,
    );
  }
}

class _BuildEmptyListIcon extends StatelessWidget {
  const _BuildEmptyListIcon({
    this.iconPath,
    this.iconSize,
    this.iconColor,
  });

  final String? iconPath;
  final double? iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppSvg.emptyList,
      width: iconSize ?? 64.r,
      height: iconSize ?? 64.r,
      color: iconColor,
    );
  }
}
