import 'package:flutter/material.dart';

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
        color: color ?? Theme.of(context).primaryColor,
      ),
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}
