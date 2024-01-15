import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';

class SocialIconsButtons extends StatelessWidget {
  const SocialIconsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Image.asset(
            AppAssets.googleIcon,
            width: 48.w,
            height: 48.h,
          ),
        ),
        // const SizedBox(width: 16),
        InkWell(
          onTap: () {},
          child: Image.asset(
            AppAssets.facebook,
            width: 32.w,
            height: 32.h,
          ),
        ),
      ],
    );
  }
}
