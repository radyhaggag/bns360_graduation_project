import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/main_list_view_builder.dart';
import '../../../../core/widgets/main_network_image.dart';

class CraftsManWorkSamplesSection extends StatelessWidget {
  const CraftsManWorkSamplesSection({super.key, required this.imagesUrls});

  final List<String> imagesUrls;

  @override
  Widget build(BuildContext context) {
    if (imagesUrls.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: context.theme.highlightColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: MainListViewBuilder(
        list: imagesUrls,
        height: 75.h,
        width: context.width,
        itemWidget: (url, index) {
          return MainNetworkImage(
            withImageView: true,
            fit: BoxFit.cover,
            imageUrl: url,
            height: 75.h,
            width: 75.w,
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
