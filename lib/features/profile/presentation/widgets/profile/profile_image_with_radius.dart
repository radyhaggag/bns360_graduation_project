import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/main_network_image.dart';

class ProfileImageWithRadius extends StatelessWidget {
  const ProfileImageWithRadius({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
  });

  final String? imageUrl;
  final double? width;
  final double? height;

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
        width: width ?? 75.r,
        height: height ?? 75.r,
        isCircular: true,
        withImageView: true,
      ),
    );
  }
}
