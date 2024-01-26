import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/category_entity.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/main_network_image.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryEntity});

  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
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
                imageUrl: categoryEntity.imageUrl,
                height: 110.h,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  LocalizationHelper.getLocalizedString(
                    context,
                    ar: categoryEntity.nameAR,
                    en: categoryEntity.nameEN,
                  ),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).cardColor,
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
