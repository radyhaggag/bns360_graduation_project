import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/media_query.dart';
import '../center_progress_indicator.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final String label;
  final void Function()? onPressed;
  final bool isLoading;
  final BorderRadius? borderRadius;

  const CustomElevatedButton({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
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
        style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
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
        style: Theme.of(context).textButtonTheme.style?.copyWith(
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
