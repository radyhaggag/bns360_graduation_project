import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/language.dart';
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
          _ItemStatusWidget(
            start: DateTime.now().subtract(const Duration(hours: 5)),
            end: DateTime.now().add(const Duration(hours: 5)),
          ),
          const SizedBox(height: 15),
          _CategoryItemLocation(
            location: LocalizationHelper.getLocalizedString(
              context,
              ar: categoryItemEntity.businessAddressArabic,
              en: categoryItemEntity.businessAddressEnglish,
            ),
          ),
          const SizedBox(height: 15),
          const _CategoryItemContactInfo(
            contactInfo: ["01030096242"],
          ),
        ],
      ),
    );
  }
}
