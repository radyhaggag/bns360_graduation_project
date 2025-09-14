import '../../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CraftsmanHeadBackground extends StatelessWidget {
  const CraftsmanHeadBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        color: AppColors.primary,
      ),
    );
  }
}
