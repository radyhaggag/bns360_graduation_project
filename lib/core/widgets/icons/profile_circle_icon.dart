import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';
import '../main_network_image.dart';

class ProfileCircleIcon extends StatelessWidget {
  const ProfileCircleIcon({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.withImageView = false,
  });

  final String? imageUrl;
  final double? width;
  final double? height;
  final bool withImageView;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: MainNetworkImage(
        withImageView: withImageView,
        imageUrl: imageUrl ?? kDefaultImgUrl,
        width: width ?? 30.r,
        height: height ?? 30.r,
      ),
    );
  }
}
