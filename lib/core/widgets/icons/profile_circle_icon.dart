import '../../utils/constants.dart';
import '../main_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCircleIcon extends StatelessWidget {
  const ProfileCircleIcon({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      width: 30.r,
      height: 30.r,
      child: MainNetworkImage(imageUrl: imageUrl ?? kDefaultImgUrl),
    );
  }
}
