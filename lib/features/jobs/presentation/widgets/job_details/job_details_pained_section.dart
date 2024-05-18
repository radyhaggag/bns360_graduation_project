import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/job_entity.dart';
import 'job_details_items_section.dart';
import 'job_details_top_section.dart';

class JobDetailsPainedSection extends SliverPersistentHeaderDelegate {
  final JobEntity jobEntity;

  JobDetailsPainedSection({required this.jobEntity});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        JobDetailsTopSection(jobEntity: jobEntity),
        JobDetailsItemsSection(
          jobEntity: jobEntity,
        ),
      ],
    );
  }

  @override
  double get maxExtent => .48.sh;

  @override
  double get minExtent => .45.sh;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
