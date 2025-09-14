import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';

class EditCraftsmanHeadBackground extends StatelessWidget {
  const EditCraftsmanHeadBackground({super.key});

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
