import 'package:bns360_graduation_project/core/helpers/localization_helper.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/widgets/job_card/save_job_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/media_query.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../domain/entities/job_entity.dart';
import 'job_publisher_image.dart';

part 'job_publisher_section.dart';
part 'title_and_sub_title_section.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key, required this.jobEntity});

  final JobEntity jobEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 100.h,
      child: Card(
        child: Column(
          children: [
            Text(
              jobEntity.jobTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            _JobPublisherSection(jobEntity: jobEntity),
          ],
        ),
      ),
    );
  }
}
