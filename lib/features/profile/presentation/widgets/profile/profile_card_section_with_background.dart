import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../core/widgets/custom_shimmer.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/profile_bloc.dart';
import 'profile_image_with_radius.dart';

class ProfileCardSectionWithBackground extends StatelessWidget {
  const ProfileCardSectionWithBackground({super.key});

  @override
  Widget build(BuildContext context) {
    const boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColors.primary,
          Color(0xffA3BDED),
        ],
        begin: AlignmentDirectional.centerEnd,
        end: AlignmentDirectional.bottomStart,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    );

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Container(
          height: context.height * .37,
          width: context.width,
          decoration: boxDecoration,
          child: Column(
            mainAxisAlignment: AppProvider().isGuest
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              ProfileImageWithRadius(
                imageUrl: context.read<ProfileBloc>().profile?.imageUrl,
              ),
              const SizedBox(height: 10),
              if (state is GetProfileLoadingState)
                ShimmerWidget.rectangular(
                  height: 30.h,
                  width: 150.w,
                  borderRadius: 16,
                )
              else
                Text(
                  context.read<ProfileBloc>().profile?.name ?? "",
                  style: context.textTheme.titleSmall?.copyWith(
                    color: AppColors.white,
                  ),
                ),
              const SizedBox(height: 20),
              const _ViewProfileButton(),
            ],
          ),
        );
      },
    );
  }
}

class _ViewProfileButton extends StatelessWidget {
  const _ViewProfileButton();

  @override
  Widget build(BuildContext context) {
    if (AppProvider().isGuest) {
      return const SizedBox.shrink();
    }

    return CustomElevatedButtonWithIcon(
      label: S.of(context).view_profile,
      width: context.width * .50,
      height: 35.h,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.editProfile);
      },
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
