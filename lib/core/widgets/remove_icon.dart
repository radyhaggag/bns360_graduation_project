import '../utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoveIcon extends StatelessWidget {
  const RemoveIcon({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 15.r,
        width: 15.r,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.red,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.close,
          size: 10.r,
          color: AppColors.white,
        ),
      ),
    );
  }
}
