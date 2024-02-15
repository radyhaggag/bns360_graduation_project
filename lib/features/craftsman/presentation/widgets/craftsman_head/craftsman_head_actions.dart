import 'package:bns360_graduation_project/core/extensions/language.dart';
import 'package:bns360_graduation_project/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class CraftsmanHeadActions extends StatelessWidget {
  const CraftsmanHeadActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: context.currentLanguage == Language.english ? 0 : null,
      left: context.currentLanguage == Language.english ? null : 0,
      child: Row(
        children: [
          _BuildBtn(
            iconData: FeatherIcons.messageCircle,
            onPressed: () {},
          ),
          _BuildBtn(
            iconData: FeatherIcons.heart,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _BuildBtn extends StatelessWidget {
  const _BuildBtn({
    required this.onPressed,
    required this.iconData,
  });

  final IconData iconData;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        size: 20.r,
        color: AppColors.primary,
      ),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(minHeight: 30.r, minWidth: 30.r),
      style: IconButton.styleFrom(
        backgroundColor: Theme.of(context).highlightColor,
      ),
      onPressed: onPressed,
    );
  }
}
