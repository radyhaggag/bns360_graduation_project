import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/category_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../core/widgets/main_network_image.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryEntity});

  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.categoryItems,
          arguments: categoryEntity,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.foregroundColor(context),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: MainNetworkImage(
                imageUrl: categoryEntity.image,
                height: 110.h,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  LocalizationHelper.getLocalizedString(
                    context,
                    ar: categoryEntity.categoryNameArabic,
                    en: categoryEntity.categoryNameEnglish,
                  ),
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.theme.cardColor,
                    fontSize: AppFontSize.details,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
