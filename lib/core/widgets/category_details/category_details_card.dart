import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/get_localized_string.dart';
import '../../../../../core/shared_data/entities/category_details_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

part 'category_details_image.dart';
part 'category_details_rating_section.dart';
part 'category_name_and_description_section.dart';

class CategoryDetailsCard extends StatelessWidget {
  final CategoryDetailsEntity categoryDetailsEntity;
  const CategoryDetailsCard({super.key, required this.categoryDetailsEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CategoryDetailsImage(
            imageUrl: categoryDetailsEntity.imageUrl,
          ),
          _CategoryDetailsNameAndDescriptionSection(
            categoryDetailsEntity: categoryDetailsEntity,
          ),
          Row(
            children: [
              _CategoryDetailsRatingSection(
                numOfRatings: categoryDetailsEntity.numOfRatings,
                starsCount: categoryDetailsEntity.starsCount,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
