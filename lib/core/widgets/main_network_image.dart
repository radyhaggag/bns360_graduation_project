import 'package:bns360_graduation_project/core/app/app_bloc.dart';
import 'package:bns360_graduation_project/core/utils/enums.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/app_colors.dart';
import '../utils/assets/app_images.dart';
import '../utils/extensions/context.dart';
import 'custom_shimmer.dart';

class MainNetworkImage extends StatelessWidget {
  const MainNetworkImage({
    super.key,
    this.width,
    this.height,
    this.fit,
    this.imageUrl,
    this.name,
    this.isCircular = false,
    this.withImageView = false,
  });

  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? imageUrl;
  final String? name;
  final bool isCircular;
  final bool withImageView;

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      if (isCircular) {
        return ClipOval(
          child: _BuildImage(
            imageUrl: imageUrl,
            width: width,
            height: height,
            isCircular: true,
            withImageView: withImageView,
          ),
        );
      }
      return _BuildImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        isCircular: false,
        withImageView: withImageView,
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
    required this.isCircular,
    this.withImageView = false,
  });

  final String? imageUrl;
  final double? width;
  final double? height;
  final bool isCircular;
  final bool withImageView;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      imageBuilder: (context, imageProvider) {
        return InkWell(
          onTap: withImageView
              ? () {
                  showImageViewer(
                    context,
                    imageProvider,
                    backgroundColor: AppColors.primary,
                    closeButtonColor: AppColors.white,
                  );
                }
              : null,
          child: Image(
            image: imageProvider,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        );
      },
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return Image.asset(
          context.read<AppBloc>().state.theme == AppTheme.light
              ? AppImages.appLogoWithWhiteBackground
              : AppImages.appLogoWithBlackBackground,
          width: width,
          height: height,
          fit: BoxFit.cover,
        );
      },
      placeholder: (context, url) {
        if (isCircular && (width != null || height != null)) {
          return ShimmerWidget.circular(size: (width ?? height)!);
        }

        if (width != null && height != null) {
          return ShimmerWidget.square(
            width: width!,
            height: height!,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
