import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onPressed,
    this.color,
  });

  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 24,
        color: color ?? context.theme.primaryColor,
      ),
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}

class CustomBackButtonWithCircle extends StatelessWidget {
  const CustomBackButtonWithCircle({
    super.key,
    this.onPressed,
    this.color,
  });

  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: context.theme.highlightColor.withOpacity(.5),
        alignment: Alignment.center,
        shape: const CircleBorder(),
        padding: const EdgeInsets.only(left: 6),
        elevation: 0,
      ),
      alignment: Alignment.center,
      icon: Icon(
        Icons.arrow_back_ios,
        size: 18.r,
        color: color ?? context.theme.primaryColor,
      ),
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}
