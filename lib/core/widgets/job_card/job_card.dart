import '../../../features/saved_items/presentation/bloc/saved_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/navigation_service.dart';
import '../../../config/route_config.dart';
import '../../../generated/l10n.dart';
import '../../helpers/date_formatter.dart';
import '../../helpers/localization_helper.dart';
import '../../shared_data/entities/job_entity.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/extensions/context.dart';
import '../../utils/extensions/media_query.dart';
import '../../utils/extensions/price.dart';
import '../buttons/custom_buttons.dart';
import '../icons/save_icon.dart';
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
    this.isInSavedScreen = false,
  });

  final JobEntity jobEntity;
  final Widget? moreWidget;
  final bool isInSavedScreen;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (moreWidget == null) const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    LocalizationHelper.getLocalizedString(
                      context,
                      ar: jobEntity.jobTitleArabic,
                      en: jobEntity.jobTitleEnglish,
                    ),
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
              description: LocalizationHelper.getLocalizedString(
                context,
                ar: jobEntity.jobDescriptionArabic,
                en: jobEntity.jobDescriptionEnglish,
              ),
            ),
            const SizedBox(height: 20),
            _JobDescriptionItems(jobEntity: jobEntity),
            const SizedBox(height: 20),
            _JobDateAndDetailsSection(
              jobEntity: jobEntity,
              isInSavedScreen: isInSavedScreen,
            ),
          ],
        ),
      ),
    );
  }
}
