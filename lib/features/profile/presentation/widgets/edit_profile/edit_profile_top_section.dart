import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/profile/profile_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/profile_bloc.dart';
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
        const SizedBox(height: 12),
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            final isProfileImageCleared =
                context.read<ProfileBloc>().isProfileImageCleared;
            if (isProfileImageCleared) {
              return const SizedBox.shrink();
            }
            return CustomElevatedButton(
              label: S.of(context).remove_profile_image,
              width: 200.w,
              height: 30.h,
              backgroundColor: AppColors.red,
              onPressed: () {
                context.read<ProfileBloc>().add(ClearProfileImageEvent());
              },
            );
          },
        ),
        SizedBox(height: 30.h),
      ],
    );
  }

  TextStyle? _textStyle(BuildContext context) {
    return context.textTheme.titleMedium?.copyWith(
      color: AppColors.white,
      fontSize: AppFontSize.subTitle,
    );
  }
}
