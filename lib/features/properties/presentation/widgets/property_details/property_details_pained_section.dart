import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/property_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../core/widgets/property_card/property_card_images_section.dart';

class PropertyDetailsPainedSection extends SliverPersistentHeaderDelegate {
  final PropertyEntity propertyEntity;

  PropertyDetailsPainedSection({
    required this.propertyEntity,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      children: [
        PropertyCardImagesSection(
          propertyEntity: propertyEntity,
          isMiniMode: false,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomBackButtonWithCircle(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 225.h;

  @override
  double get minExtent => 200.h;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
