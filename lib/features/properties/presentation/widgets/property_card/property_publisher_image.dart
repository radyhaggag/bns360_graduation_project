import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/main_network_image.dart';

class PropertyPublisherImage extends StatelessWidget {
  final String imageUrl;
  const PropertyPublisherImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: MainNetworkImage(
        imageUrl: imageUrl,
        width: 50.r,
        height: 50.r,
        fit: BoxFit.cover,
      ),
    );
  }
}
