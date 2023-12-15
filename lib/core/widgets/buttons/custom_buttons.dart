import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/media_query.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final String label;
  final void Function()? onPressed;

  const CustomElevatedButton({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 50.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: MaterialStatePropertyAll(backgroundColor),
            ),
        child: Text(label),
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

  const CustomOutlinedButton({
    super.key,
    this.width,
    this.height,
    this.foregroundColor,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 50.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
              foregroundColor: MaterialStatePropertyAll(foregroundColor),
            ),
        child: Text(label),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? foregroundColor;
  final String label;
  final void Function()? onPressed;

  const CustomTextButton({
    super.key,
    this.width,
    this.height,
    this.foregroundColor,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 50.h,
      child: TextButton(
        onPressed: onPressed,
        style: Theme.of(context).textButtonTheme.style?.copyWith(
              foregroundColor: MaterialStatePropertyAll(foregroundColor),
            ),
        child: Text(label),
      ),
    );
  }
}
