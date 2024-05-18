import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/extensions/context.dart';
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
  final bool isDisabled;

  const CustomElevatedButton({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 45.h,
      child: ElevatedButton(
        onPressed: (!isLoading && !isDisabled) ? onPressed : null,
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
  final Color? backgroundColor;
  final String label;
  final void Function()? onPressed;
  final bool isLoading;

  const CustomOutlinedButton({
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
      child: OutlinedButton(
        onPressed: !isLoading ? onPressed : null,
        style: context.theme.outlinedButtonTheme.style?.copyWith(
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

class CustomElevatedButtonWithIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String label;
  final void Function()? onPressed;
  final bool isLoading;
  final BorderRadius? borderRadius;
  final Widget? leading;
  final Widget? trailing;
  final double? fontSize;
  final bool isExpanded;

  const CustomElevatedButtonWithIcon({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.borderRadius,
    this.leading,
    this.trailing,
    this.fontSize,
    this.isExpanded = true,
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
                  if (leading != null) ...[const SizedBox(width: 10), leading!],
                  const SizedBox(width: 10),
                  if (isExpanded)
                    Expanded(child: _textWidget(context))
                  else
                    _textWidget(context),
                  if (trailing != null) trailing!,
                ],
              ),
      ),
    );
  }

  Widget _textWidget(BuildContext context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          label,
          style: context.textTheme.titleSmall?.copyWith(
            fontSize: fontSize,
            color: foregroundColor,
          ),
        ),
      );
}

class CustomOutlinedButtonWithIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String label;
  final void Function()? onPressed;
  final bool isLoading;
  final BorderRadius? borderRadius;
  final Widget? leading;
  final Widget? trailing;
  final double? fontSize;
  final bool isExpanded;

  const CustomOutlinedButtonWithIcon({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.borderRadius,
    this.leading,
    this.trailing,
    this.fontSize,
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 45.h,
      child: OutlinedButton(
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
                  if (leading != null) ...[const SizedBox(width: 10), leading!],
                  const SizedBox(width: 10),
                  if (isExpanded)
                    Expanded(child: _textWidget(context))
                  else
                    _textWidget(context),
                  if (trailing != null) trailing!,
                ],
              ),
      ),
    );
  }

  Widget _textWidget(BuildContext context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          label,
          style: context.textTheme.titleSmall?.copyWith(
            fontSize: fontSize,
            color: foregroundColor,
          ),
        ),
      );
}
