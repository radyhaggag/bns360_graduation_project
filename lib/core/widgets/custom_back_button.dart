import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 24,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}
