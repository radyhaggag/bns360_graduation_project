import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/property_entity.dart';
import 'property_details_items_section.dart';
import 'property_details_top_section.dart';

class PropertyDetailsPainedSection extends SliverPersistentHeaderDelegate {
  final PropertyEntity propertyEntity;

  PropertyDetailsPainedSection({required this.propertyEntity});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        PropertyDetailsTopSection(propertyEntity: propertyEntity),
        PropertyDetailsItemsSection(
          propertyEntity: propertyEntity,
        ),
      ],
    );
  }

  @override
  double get maxExtent => .45.sh;

  @override
  double get minExtent => .40.sh;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
