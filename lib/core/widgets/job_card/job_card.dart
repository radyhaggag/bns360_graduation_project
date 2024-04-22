import 'package:bns360_graduation_project/config/route_config.dart';
import 'package:bns360_graduation_project/core/helpers/date_formatter.dart';
import 'package:bns360_graduation_project/core/helpers/localization_helper.dart';
import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/utils/extensions/price.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:bns360_graduation_project/core/widgets/job_card/save_job_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';
import '../../shared_data/entities/job_entity.dart';
import '../../utils/app_fonts.dart';
import '../../utils/extensions/media_query.dart';
import 'job_publisher_image.dart';

part 'job_date_and_details_section.dart';
part 'job_description_section.dart';
part 'job_details_items.dart';
part 'job_publisher_section.dart';
part 'title_and_sub_title_section.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    super.key,
    required this.jobEntity,
    this.moreWidget,
  });

  final JobEntity jobEntity;
  final Widget? moreWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.theme.highlightColor,
        ),
        child: Column(
          children: [
            if (moreWidget == null) const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    jobEntity.jobTitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontSize: AppFontSize.subTitle,
                    ),
                  ),
                ),
                if (moreWidget != null) moreWidget!,
              ],
            ),
            _JobPublisherSection(jobEntity: jobEntity),
            const SizedBox(height: 10),
            _JobDescriptionSection(
              description: jobEntity.description,
            ),
            const SizedBox(height: 20),
            _JobDescriptionItems(jobEntity: jobEntity),
            const SizedBox(height: 20),
            _JobDateAndDetailsSection(jobEntity: jobEntity),
          ],
        ),
      ),
    );
  }
}
