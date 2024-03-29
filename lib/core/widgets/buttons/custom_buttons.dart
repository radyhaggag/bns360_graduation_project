import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/extensions/media_query.dart';
import '../center_progress_indicator.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String label;
  final void Function()? onPressed;
  final bool isLoading;
  final BorderRadius? borderRadius;

  const CustomElevatedButton({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 45.h,
      child: ElevatedButton(
        onPressed: !isLoading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: borderRadius != null
              ? RoundedRectangleBorder(borderRadius: borderRadius!)
              : null,
        ),
        child: isLoading
            ? const CenterProgressIndicator()
            : FittedBox(
                child: Text(label),
              ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? foregroundColor;
  final String label;
  final void Function()? onPressed;
  final bool isLoading;

  const CustomOutlinedButton({
    super.key,
    this.width,
    this.height,
    this.foregroundColor,
    required this.label,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 45.h,
      child: OutlinedButton(
        onPressed: !isLoading ? onPressed : null,
        style: context.theme.outlinedButtonTheme.style?.copyWith(
          foregroundColor: MaterialStatePropertyAll(foregroundColor),
        ),
        child: isLoading
            ? const CenterProgressIndicator()
            : FittedBox(
                child: Text(label),
              ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final String label;
  final void Function()? onPressed;
  final bool isLoading;
  const CustomTextButton({
    super.key,
    this.width,
    this.height,
    this.foregroundColor,
    this.backgroundColor,
    required this.label,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 45.h,
      child: TextButton(
        onPressed: !isLoading ? onPressed : null,
        style: context.theme.textButtonTheme.style?.copyWith(
          foregroundColor: MaterialStatePropertyAll(foregroundColor),
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
        ),
        child: isLoading
            ? const CenterProgressIndicator()
            : FittedBox(
                child: Text(label),
              ),
      ),
    );
  }
}

class CustomElevatedButtonWithLeading extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String label;
  final void Function()? onPressed;
  final bool isLoading;
  final BorderRadius? borderRadius;
  final Widget leading;

  const CustomElevatedButtonWithLeading({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.borderRadius,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 45.h,
      child: ElevatedButton(
        onPressed: !isLoading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: borderRadius != null
              ? RoundedRectangleBorder(borderRadius: borderRadius!)
              : null,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
        ),
        child: isLoading
            ? const CenterProgressIndicator()
            : Row(
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      label,
                    ),
                  ),
                  leading,
                ],
              ),
      ),
    );
  }
}
