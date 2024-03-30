import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyAreaWidget extends StatelessWidget {
  const PropertyAreaWidget({
    super.key,
    required this.area,
    this.fontSize,
  });

  final String area;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.aspect_ratio_rounded,
          color: context.theme.cardColor,
          size: 20.r,
        ),
        const SizedBox(width: 10),
        Text(
          area,
          style: context.textTheme.titleSmall?.copyWith(
            fontSize: fontSize ?? AppFontSize.light,
            color: context.theme.cardColor,
          ),
        ),
      ],
    );
  }
}
