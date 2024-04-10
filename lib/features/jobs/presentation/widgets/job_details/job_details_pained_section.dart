import 'package:bns360_graduation_project/features/jobs/domain/entities/job_entity.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/widgets/job_details/job_details_items_section.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/widgets/job_details/job_details_top_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  double get minExtent => .40.sh;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
