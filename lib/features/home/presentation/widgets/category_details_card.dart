import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/get_localized_string.dart';
import '../../../../core/shared_data/entities/category_details_entity.dart';
import '../../../../core/utils/app_styles.dart';

class CategoryDetailsCard extends StatelessWidget {
  final CategoryDetailsEntity categoryDetailsEntity;
  const CategoryDetailsCard({super.key, required this.categoryDetailsEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: categoryDetailsEntity.imageUrl,
              width: 250.w,
              height: 150.h,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 250.w,
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getLocalizedString(
                    context,
                    ar: categoryDetailsEntity.nameAR,
                    en: categoryDetailsEntity.nameEN,
                  ),
                  style: AppStyles.getSemiBoldStyle(),
                ),
                const SizedBox(height: 10),
                Text(
                  getLocalizedString(
                    context,
                    ar: categoryDetailsEntity.descriptionAR,
                    en: categoryDetailsEntity.descriptionEN,
                  ),
                  style: AppStyles.getRegularStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
