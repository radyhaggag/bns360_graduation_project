import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../center_progress_indicator.dart';
import 'custom_buttons.dart';

class CustomElevatedButtonWithLoading extends StatelessWidget {
  final bool isLoading;
  final String label;
  final void Function()? onPressed;
  final double? height;
  const CustomElevatedButtonWithLoading({
    super.key,
    required this.isLoading,
    required this.label,
    this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45.h,
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 250),
        firstChild: CustomElevatedButton(
          onPressed: onPressed,
          label: label,
          height: height,
        ),
        secondChild: const CenterProgressIndicator(),
        crossFadeState:
            isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      ),
    );
  }
}

class CustomOutlinedButtonWithLoading extends StatelessWidget {
  final bool isLoading;
  final String label;
  final void Function()? onPressed;
  final double? height;
  const CustomOutlinedButtonWithLoading({
    super.key,
    required this.isLoading,
    required this.label,
    this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45.h,
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 250),
        firstChild: CustomOutlinedButton(
          onPressed: onPressed,
          label: label,
          height: height,
        ),
        secondChild: const CenterProgressIndicator(),
        crossFadeState:
            isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      ),
    );
  }
}

class CustomTextButtonWithLoading extends StatelessWidget {
  final bool isLoading;
  final String label;
  final void Function()? onPressed;
  final double? height;
  const CustomTextButtonWithLoading({
    super.key,
    required this.isLoading,
    required this.label,
    this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45.h,
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 250),
        firstChild: CustomTextButton(
          onPressed: onPressed,
          label: label,
          height: height,
        ),
        secondChild: const CenterProgressIndicator(),
        crossFadeState:
            isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      ),
    );
  }
}
