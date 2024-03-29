import 'package:bns360_graduation_project/features/properties/domain/entities/property_entity.dart';
import 'package:bns360_graduation_project/features/properties/presentation/widgets/property_details/property_details_items_section.dart';
import 'package:bns360_graduation_project/features/properties/presentation/widgets/property_details/property_details_top_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        JobDetailsTopSection(jobEntity: propertyEntity),
        JobDetailsItemsSection(
          jobEntity: propertyEntity,
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
