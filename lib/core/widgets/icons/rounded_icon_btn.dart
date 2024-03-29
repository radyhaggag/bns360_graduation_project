import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.size,
    required this.icon,
    this.addMargin = false,
  });

  final void Function()? onPressed;
  final Widget icon;
  final bool addMargin;
  final Color? backgroundColor;
  final double? size;

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
      child: IconButton(
        onPressed: () => onPressed?.call(),
        style: IconButton.styleFrom(
          backgroundColor: context.theme.hintColor.withOpacity(.05),
          padding: EdgeInsets.zero,
        ),
        icon: icon,
      ),
    );
  }
}
