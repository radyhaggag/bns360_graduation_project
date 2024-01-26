import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CraftsSearchIcon extends StatelessWidget {
  const CraftsSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: InkWell(
        onTap: () {},
        child: CircleAvatar(
          backgroundColor: AppColors.lightBackground,
          child: Icon(
            FeatherIcons.search,
            size: 25.r,
          ),
        ),
      ),
    );
  }
}
