import 'package:flutter/material.dart';

import '../../utils/extensions/context.dart';
import '../buttons/custom_buttons.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.size,
    required this.icon,
    this.addMargin = false,
    this.isLoading = false,
    this.padding,
  });

  final void Function()? onPressed;
  final Widget icon;
  final bool addMargin;
  final Color? backgroundColor;
  final double? size;
  final bool isLoading;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: addMargin
          ? const EdgeInsets.symmetric(horizontal: 5, vertical: 2)
          : EdgeInsets.zero,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: CustomIconButton(
        isLoading: isLoading,
        onPressed: () => onPressed?.call(),
        backgroundColor: context.theme.hintColor.withOpacity(.05),
        padding: EdgeInsets.zero,
        // ),
        icon: icon,
      ),
    );
  }
}
