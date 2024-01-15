import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class EmptyMessageWidget extends StatelessWidget {
  final String message;
  final Color? backgroundColor;

  const EmptyMessageWidget({
    super.key,
    required this.message,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.black.withOpacity(.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(message),
    );
  }
}
