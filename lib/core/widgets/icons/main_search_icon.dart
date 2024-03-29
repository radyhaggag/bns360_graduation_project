import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainSearchIcon extends StatelessWidget {
  const MainSearchIcon({
    super.key,
    this.onTap,
    this.horizontalPadding,
  });
  final void Function()? onTap;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 13,
      ),
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: context.theme.listTileTheme.tileColor,
          child: Icon(
            FeatherIcons.search,
            size: 25.r,
            color: context.theme.cardColor,
          ),
        ),
      ),
    );
  }
}
