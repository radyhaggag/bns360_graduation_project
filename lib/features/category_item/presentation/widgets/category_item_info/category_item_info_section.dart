import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../../core/extensions/language.dart';
import '../../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';

part 'category_item_location.dart';
part 'category_item_status.dart';
part 'category_item_contact_info.dart';

class CategoryItemInfoSection extends StatelessWidget {
  const CategoryItemInfoSection({super.key, required this.categoryItemEntity});

  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding - 10,
      ),
      child: Column(
        children: [
          _ItemStatusWidget(
            start: DateTime.now().subtract(const Duration(hours: 5)),
            end: DateTime.now().add(const Duration(hours: 5)),
          ),
          const SizedBox(height: 15),
          const _CategoryItemLocation(
            location: 'Elkornish, Beni suef',
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
