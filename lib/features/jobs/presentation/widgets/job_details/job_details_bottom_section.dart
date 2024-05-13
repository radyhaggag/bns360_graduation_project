import 'package:bns360_graduation_project/core/helpers/localization_helper.dart';
import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/widgets/requirements_widget/requirements_builder.dart';
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
            description: LocalizationHelper.getLocalizedString(
              context,
              ar: jobEntity.jobDescriptionArabic,
              en: jobEntity.jobDescriptionEnglish,
            ),
          ),
          const SizedBox(height: 15),
          _RequirementsSection(
            requirements: LocalizationHelper.getLocalizedValue(
              context,
              ar: jobEntity.requirementsArabic.requirements,
              en: jobEntity.requirementEnglish.requirements,
            ) as List<String>,
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class _RequirementsSection extends StatelessWidget {
  const _RequirementsSection({
    required this.requirements,
  });

  final List<String> requirements;

  @override
  Widget build(BuildContext context) {
    if (requirements.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      width: context.width,
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
          const RequirementsBuilder(
            isReadOnly: true,
            withTranslation: false,
          ),
        ],
      ),
    );
  }
}
