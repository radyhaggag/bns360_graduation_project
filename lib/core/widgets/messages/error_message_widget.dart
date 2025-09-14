import '../custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/extensions/context.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final bool addBackButton;

  const ErrorMessageWidget({
    super.key,
    required this.message,
    this.backgroundColor,
    this.height,
    this.width,
    this.addBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? context.theme.primaryColor.withOpacity(.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 40.r,
            color: AppColors.error,
          ),
          const SizedBox(height: 5),
          Text(message),
          if (addBackButton) ...[
            const SizedBox(height: 25),
            const CustomBackButtonWithCircle(
              color: AppColors.error,
            ),
          ]
        ],
      ),
    );
  }
}
