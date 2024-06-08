import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({
    super.key,
    required this.message,
    this.title,
  });

  final String message;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: context.theme.highlightColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: context.theme.textTheme.titleSmall?.copyWith(
                fontSize: AppFontSize.body,
              ),
            ),
            const SizedBox(height: 10),
          ],
          Text(
            message,
            style: context.theme.textTheme.titleSmall?.copyWith(
              fontSize: AppFontSize.details,
            ),
          ),
        ],
      ),
    );
  }
}
