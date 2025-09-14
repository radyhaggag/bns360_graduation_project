import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsItem extends StatelessWidget {
  const AboutUsItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.primary,
            ),
          ),
          12.verticalSpace,
          Text(
            subtitle,
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
