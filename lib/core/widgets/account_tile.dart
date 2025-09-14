import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants.dart';
import 'main_network_image.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({
    super.key,
    this.imageUrl,
    required this.accountName,
  });

  final String? imageUrl;
  final String accountName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3.h,
        horizontal: 5.w,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 2.h,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            Color(0xff222043),
            Color.fromARGB(255, 25, 20, 113),
          ],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomCenter,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          _BuildImage(
            imageUrl: imageUrl,
          ),
          SizedBox(width: 10.w),
          Flexible(
            child: Text(
              accountName,
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildImage extends StatelessWidget {
  const _BuildImage({this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.theme.highlightColor,
      ),
      padding: EdgeInsets.all(2.r),
      child: MainNetworkImage(
        imageUrl: imageUrl ?? kDefaultImgUrl,
        width: 50.r,
        height: 50.r,
        isCircular: true,
        withImageView: false,
      ),
    );
  }
}
