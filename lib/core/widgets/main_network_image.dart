import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MainNetworkImage extends StatelessWidget {
  const MainNetworkImage({
    super.key,
    this.width,
    this.height,
    this.fit,
    required this.imageUrl,
  });

  final double? width;
  final double? height;
  final BoxFit? fit;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
