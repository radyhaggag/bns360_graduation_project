import 'package:bns360_graduation_project/core/utils/enums/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/work_days.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/buttons/map_btn.dart';
import '../../../../../generated/l10n.dart';
import '../../../../map/domain/params/map_params.dart';

part 'category_item_contact_info.dart';
part 'category_item_location.dart';
part 'category_item_status.dart';

class CategoryItemInfoSection extends StatelessWidget {
  const CategoryItemInfoSection({super.key, required this.categoryItemEntity});

  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: context.theme.highlightColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          if (categoryItemEntity.isAlwaysWorkingAndHasNotHolidays ||
              categoryItemEntity.isWorking24HourExceptHoliday) ...[
            InfoCard(categoryItemEntity: categoryItemEntity),
            const SizedBox(height: 15),
          ],
          _ItemStatusWidget(
            start: categoryItemEntity.opening,
            end: categoryItemEntity.closing,
            holiday: categoryItemEntity.holidays,
            isWorking24Hours: categoryItemEntity.isWorking24Hour,
          ),
          const SizedBox(height: 15),
          _CategoryItemLocation(
            categoryItemEntity: categoryItemEntity,
          ),
          const SizedBox(height: 15),
          _CategoryItemContactInfo(
            phoneNumbers: (categoryItemEntity.contacts.phoneNumber ?? "")
                .split("-")
                .toList(),
            email: categoryItemEntity.contacts.email,
            url: categoryItemEntity.contacts.urlSite,
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.categoryItemEntity,
  });

  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.info,
          color: context.theme.cardColor.withAlpha(80),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(message(context)),
        ),
      ],
    );
  }

  String message(BuildContext context) {
    if (categoryItemEntity.isAlwaysWorkingAndHasNotHolidays) {
      return S.of(context).business_no_holidays;
    } else if (categoryItemEntity.isWorking24HourExceptHoliday) {
      final holiday =
          WorkDay.localizedName(context, categoryItemEntity.holidays);
      return "${S.of(context).business_specified_holidays} ($holiday)";
    } else {
      return "";
    }
  }
}
