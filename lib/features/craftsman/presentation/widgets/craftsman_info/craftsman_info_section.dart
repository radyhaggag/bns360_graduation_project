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
          _ItemStatusWidget(
            start: craftsmanEntity.opening,
            end: craftsmanEntity.closing,
            holiday: craftsmanEntity.holidays,
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
