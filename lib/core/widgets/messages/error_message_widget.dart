import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;
  final Color? backgroundColor;

  const ErrorMessageWidget({
    super.key,
    required this.message,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.black.withOpacity(.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(
            Icons.error,
            size: 40.r,
            color: AppColors.error,
          ),
          const SizedBox(height: 5),
          Text(message),
        ],
      ),
    );
  }
}
