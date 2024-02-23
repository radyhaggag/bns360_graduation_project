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
  });

  final String? imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: MainNetworkImage(
        imageUrl: imageUrl ?? kDefaultImgUrl,
        width: width ?? 30.r,
        height: height ?? 30.r,
      ),
    );
  }
}
