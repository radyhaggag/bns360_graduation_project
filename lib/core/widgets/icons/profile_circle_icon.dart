import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../utils/app_colors.dart';

class ProfileCircleIcon extends StatelessWidget {
  const ProfileCircleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primary,
          width: 1.5,
        ),
      ),
      child: const Icon(FeatherIcons.user),
    );
  }
}
