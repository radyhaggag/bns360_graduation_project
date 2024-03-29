import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/widgets/job_card/save_job_btn.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_back_button.dart';
import '../../../domain/entities/job_entity.dart';

class JobDetailsScreenAppBar extends StatelessWidget {
  const JobDetailsScreenAppBar({super.key, required this.jobEntity});

  final JobEntity jobEntity;

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.primary,
      leading: CustomBackButton(
        color: Colors.white,
      ),
      actions: [
        SaveJobBtn(
          notSavedColor: AppColors.white,
        ),
      ],
    );
  }
}
