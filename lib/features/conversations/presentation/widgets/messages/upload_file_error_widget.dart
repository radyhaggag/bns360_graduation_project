import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadFileErrorWidget extends StatelessWidget {
  const UploadFileErrorWidget({
    super.key,
    this.onPressedRetry,
  });

  final VoidCallback? onPressedRetry;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(4.r),
          decoration: ShapeDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: const CircleBorder(),
          ),
          height: 40.r,
          width: 40.r,
          child: InkWell(
            onTap: onPressedRetry,
            child: Icon(
              Icons.refresh_rounded,
              color: AppColors.white,
              size: 40.r - 8.r,
            ),
          ),
        ),
      ),
    );
  }
}
