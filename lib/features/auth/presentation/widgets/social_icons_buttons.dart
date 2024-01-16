import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets/app_images.dart';
import '../../../../core/utils/app_colors.dart';

class SocialIconsButtons extends StatelessWidget {
  const SocialIconsButtons({super.key});

  ButtonStyle get mainStyle => IconButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: AppColors.black.withOpacity(.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          style: mainStyle,
          icon: Image.asset(
            AppImages.googleIcon,
            width: 45.w,
            height: 45.h,
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          style: mainStyle,
          icon: Image.asset(
            AppImages.facebook,
            width: 45.w,
            height: 45.h,
          ),
        ),
      ],
    );
  }
}
