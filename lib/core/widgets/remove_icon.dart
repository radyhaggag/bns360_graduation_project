import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

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

class DeleteIcon extends StatelessWidget {
  const DeleteIcon({
    super.key,
    this.onTap,
    this.isLoading = false,
  });

  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      onPressed: onTap,
      size: 25.r,
      isLoading: isLoading,
      padding: EdgeInsets.zero,
      backgroundColor: AppColors.red,
      foregroundColor: AppColors.white,
      icon: Icon(
        Icons.delete,
        size: 20.r,
        color: AppColors.white,
      ),
    );
  }
}
