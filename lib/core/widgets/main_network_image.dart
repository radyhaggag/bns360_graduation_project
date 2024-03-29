import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MainNetworkImage extends StatelessWidget {
  const MainNetworkImage({
    super.key,
    this.width,
    this.height,
    this.fit,
    this.imageUrl,
    this.name,
    this.isCircular = false,
  });

  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? imageUrl;
  final String? name;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      if (isCircular) {
        return ClipOval(
          child: _BuildImage(
            imageUrl: imageUrl,
            width: width,
            height: height,
          ),
        );
      }
      return _BuildImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
      );
    } else {
      if ((name ?? "").isEmpty) {
        return const SizedBox.shrink();
      }
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.theme.primaryColor.withAlpha(20),
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        ),
        alignment: Alignment.center,
        child: Text(
          name![0].toUpperCase(),
          style: context.textTheme.titleMedium,
        ),
      );
    }
  }
}

class _BuildImage extends StatelessWidget {
  const _BuildImage({
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  final String? imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
