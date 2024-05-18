import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/main_network_image.dart';

class ProfileImageWithRadius extends StatelessWidget {
  const ProfileImageWithRadius({
    super.key,
    this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.theme.highlightColor,
      ),
      padding: EdgeInsets.all(2.r),
      child: ClipOval(
        child: MainNetworkImage(
          imageUrl: imageUrl ?? kDefaultImgUrl,
          width: 75.r,
          height: 75.r,
        ),
      ),
    );
  }
}
