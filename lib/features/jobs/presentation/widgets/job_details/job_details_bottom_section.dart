import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/job_entity.dart';
import '../../../../../core/widgets/description_widget.dart';
import '../../../../../generated/l10n.dart';

class JobDetailsBottomSection extends StatelessWidget {
  const JobDetailsBottomSection({super.key, required this.jobEntity});

  final JobEntity jobEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      padding: EdgeInsets.only(bottom: 50.h),
      child: Column(
        children: [
          DescriptionSection(
            description: jobEntity.description,
          ),
          const SizedBox(height: 15),
          _RequirementsSection(
            requirements: jobEntity.requirements,
          ),
        ],
      ),
    );
  }
}

class _RequirementsSection extends StatelessWidget {
  const _RequirementsSection({
    required this.requirements,
  });

  final String requirements;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.theme.highlightColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).requirements,
            style: context.textTheme.titleSmall?.copyWith(
              fontSize: AppFontSize.body,
              color: context.theme.cardColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            requirements,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: AppFontSize.details,
              color: context.theme.primaryColor.withOpacity(.6),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
