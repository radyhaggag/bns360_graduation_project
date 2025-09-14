import 'package:flutter/material.dart';

import '../../../../core/shared_data/entities/job_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/job_details/job_details_body.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key, required this.jobEntity});

  final JobEntity jobEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      body: JobDetailsBody(
        jobEntity: jobEntity,
      ),
    );
  }
}
