import 'package:flutter/material.dart';

import '../../../../../core/shared_data/entities/job_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../core/widgets/job_card/save_job_btn.dart';

class JobDetailsScreenAppBar extends StatelessWidget {
  const JobDetailsScreenAppBar({super.key, required this.jobEntity});

  final JobEntity jobEntity;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.primary,
      leading: const CustomBackButton(
        color: Colors.white,
      ),
      actions: [
        SaveJobBtn(
          notSavedColor: AppColors.white,
          jobId: jobEntity.id,
        ),
      ],
    );
  }
}
