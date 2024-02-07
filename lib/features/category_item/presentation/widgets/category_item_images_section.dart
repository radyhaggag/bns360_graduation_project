import 'package:flutter/material.dart';

import '../../../../core/extensions/media_query.dart';
import '../../../../core/widgets/main_network_image.dart';

class CategoryItemImagesSection extends StatelessWidget {
  const CategoryItemImagesSection({
    super.key,
    required this.imagesUrls,
  });

  final List<String> imagesUrls;

  @override
  Widget build(BuildContext context) {
    return MainNetworkImage(
      imageUrl: imagesUrls.first,
      width: context.width,
      fit: BoxFit.cover,
    );
  }
}
