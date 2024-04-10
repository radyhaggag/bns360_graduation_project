import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/icons/profile_circle_icon.dart';
import '../../../../../core/widgets/main_network_image.dart';
import '../../bloc/profile_bloc.dart';

class ChangeProfileImageWidget extends StatelessWidget {
  const ChangeProfileImageWidget({
    super.key,
    this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) {
        return current is ProfileImageChangedState;
      },
      builder: (context, state) {
        final newImagePath = context.read<ProfileBloc>().newImagePath;
        final isProfileImageCleared = context.read<ProfileBloc>().isProfileImageCleared;
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            if (newImagePath != null)
              Image.file(
                File(newImagePath),
                width: 100.r,
                height: 100.r,
              )
            else
              ClipOval(
                child: imageUrl != null && !isProfileImageCleared
                    ? MainNetworkImage(
                        imageUrl: imageUrl!,
                        width: 100.r,
                        height: 100.r,
                      )
                    : ProfileCircleIcon(
                        width: 100.r,
                        height: 100.r,
                      ),
              ),
            CircleAvatar(
              radius: 17.r,
              backgroundColor: AppColors.light,
              child: InkWell(
                onTap: () {
                  context.read<ProfileBloc>().add(ChangeProfileImageEvent());
                },
                child: const Icon(
                  Icons.photo_camera_rounded,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
