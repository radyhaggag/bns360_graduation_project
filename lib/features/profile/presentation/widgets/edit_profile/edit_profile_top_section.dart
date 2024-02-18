import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/profile/profile_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../generated/l10n.dart';
import 'change_profile_image_widget.dart';

class EditProfileTopSection extends StatelessWidget {
  const EditProfileTopSection({
    super.key,
    required this.profile,
  });

  final ProfileEntity profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).profile,
          style: _textStyle(context),
        ),
        const SizedBox(height: 12),
        ChangeProfileImageWidget(
          imageUrl: profile.imageUrl,
        ),
        const SizedBox(height: 12),
        Text(
          profile.name,
          style: _textStyle(context),
        ),
        SizedBox(height: 65.h),
      ],
    );
  }

  TextStyle? _textStyle(context) {
    return Theme.of(context).textTheme.titleMedium?.copyWith(
          color: AppColors.white,
          fontSize: AppFontSize.subTitle,
        );
  }
}
