import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main_network_image.dart';

class JobPublisherImage extends StatelessWidget {
  final String? imageUrl;

  const JobPublisherImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return MainNetworkImage(
      imageUrl: imageUrl,
      width: 50.r,
      height: 50.r,
      fit: BoxFit.cover,
      isCircular: true,
      withImageView: true,
    );
  }
}
