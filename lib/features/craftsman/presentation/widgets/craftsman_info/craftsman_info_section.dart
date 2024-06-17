import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/work_days.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../generated/l10n.dart';

part 'craftsman_contact_info.dart';
part 'craftsman_location.dart';
part 'craftsman_status.dart';

class CraftsmanInfoSection extends StatelessWidget {
  const CraftsmanInfoSection({super.key, required this.craftsmanEntity});

  final CraftsmanEntity craftsmanEntity;

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
          if (craftsmanEntity.isAlwaysWorkingAndHasNotHolidays ||
              craftsmanEntity.isWorking24HourExceptHoliday) ...[
            InfoCard(craftsmanEntity: craftsmanEntity),
            const SizedBox(height: 15),
          ],
          _ItemStatusWidget(
            start: craftsmanEntity.opening,
            end: craftsmanEntity.closing,
            holiday: craftsmanEntity.holidays,
            isWorking24Hour: craftsmanEntity.isWorking24Hour,
          ),
          const SizedBox(height: 15),
          _CraftsmanLocation(
            location: LocalizationHelper.getLocalizedString(
              context,
              ar: craftsmanEntity.addressAR,
              en: craftsmanEntity.addressEN,
            ),
          ),
          const SizedBox(height: 15),
          _CraftsmanContactInfo(
            phoneNumbers:
                (craftsmanEntity.contact.phoneNumber ?? "").split("-").toList(),
            email: craftsmanEntity.contact.email,
            url: craftsmanEntity.contact.urlSite,
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

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
    if (craftsmanEntity.isAlwaysWorkingAndHasNotHolidays) {
      return S.of(context).craftsman_no_holidays;
    } else if (craftsmanEntity.isWorking24HourExceptHoliday) {
      final holiday = WorkDay.localizedName(context, craftsmanEntity.holidays);
      return "${S.of(context).craftsman_specified_holidays} ($holiday)";
    } else {
      return "";
    }
  }
}
