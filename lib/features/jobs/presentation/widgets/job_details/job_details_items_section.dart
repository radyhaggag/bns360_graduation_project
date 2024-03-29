import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/features/jobs/domain/entities/job_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class JobDetailsItemsSection extends StatelessWidget {
  const JobDetailsItemsSection({super.key, required this.jobEntity});

  final JobEntity jobEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: context.theme.highlightColor,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 70.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _DetailsItem(
              title: S.of(context).job_type,
              value: jobType(context),
            ),
          ),
          const _CustomDivider(),
          Expanded(
            child: _DetailsItem(
              title: S.of(context).work_hours,
              value: "${jobEntity.workHours} ${S.of(context).hr_work}",
            ),
          ),
          const _CustomDivider(),
          Expanded(
            child: _DetailsItem(
              title: S.of(context).salary,
              value:
                  "${S.of(context).egypt_currency} ${jobEntity.salary.toString()}",
            ),
          ),
        ],
      ),
    );
  }

  String jobType(BuildContext context) {
    if (jobEntity.workHours > 4) {
      return S.of(context).full_time;
    }
    return S.of(context).part_time;
  }
}

class _DetailsItem extends StatelessWidget {
  const _DetailsItem({required this.value, required this.title});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.theme.primaryColor.withOpacity(.7),
              fontSize: AppFontSize.light,
            ),
            maxLines: 1,
          ),
          const SizedBox(height: 5),
          Text(
            value,
            textAlign: TextAlign.center,
            style: context.textTheme.titleSmall?.copyWith(
              color: context.theme.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: AppFontSize.details,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.hintColor,
      width: 2,
      height: 45.h,
    );
  }
}
