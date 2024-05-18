import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/center_progress_indicator.dart';

class UploadFileLoadingWidget extends StatelessWidget {
  const UploadFileLoadingWidget({
    super.key,
    required this.progress,
    this.onPressedCancel,
  });

  final double progress;
  final VoidCallback? onPressedCancel;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(4.r),
          decoration: ShapeDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: const CircleBorder(),
          ),
          height: 40.r,
          width: 40.r,
          child: Stack(
            children: [
              Positioned.fill(
                child: CenterProgressIndicator(
                  value: progress,
                ),
              ),
              Positioned.fill(
                child: InkWell(
                  onTap: onPressedCancel,
                  child: Center(
                    child: Icon(
                      Icons.close_rounded,
                      color: AppColors.white,
                      size: 20.r,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
