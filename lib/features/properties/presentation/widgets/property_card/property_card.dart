import 'package:bns360_graduation_project/config/route_config.dart';
import 'package:bns360_graduation_project/core/helpers/date_formatter.dart';
import 'package:bns360_graduation_project/core/helpers/localization_helper.dart';
import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/widgets/job_card/save_job_btn.dart';
import 'package:bns360_graduation_project/features/properties/domain/entities/property_entity.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'property_publisher_image.dart';

part 'property_date_and_details_section.dart';
part 'property_description_section.dart';
part 'property_details_items.dart';
part 'property_publisher_section.dart';
part 'title_and_sub_title_section.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key, required this.propertyEntity});

  final PropertyEntity propertyEntity;

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
            const SizedBox(height: 10),
            Text(
              propertyEntity.location,
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: AppFontSize.subTitle,
              ),
            ),
            _PropertyPublisherSection(propertyEntity: propertyEntity),
            const SizedBox(height: 10),
            _PropertyDescriptionSection(
              description: propertyEntity.description,
            ),
            const SizedBox(height: 20),
            _PropertyDescriptionItems(propertyEntity: propertyEntity),
            const SizedBox(height: 20),
            _PropertyDateAndDetailsSection(propertyEntity: propertyEntity),
          ],
        ),
      ),
    );
  }
}
