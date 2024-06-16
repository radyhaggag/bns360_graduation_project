import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/route_config.dart';
import '../../../features/category_item/domain/params/category_item_screen_params.dart';
import '../../helpers/localization_helper.dart';
import '../../shared_data/entities/category_item_info_entity.dart';
import '../../utils/extensions/context.dart';
import '../icons/favorite_icon.dart';
import '../main_network_image.dart';
import '../ratings_item_with_count.dart';

part 'category_item_image.dart';
part 'category_item_name_and_description_section.dart';

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({
    super.key,
    required this.categoryItemEntity,
    this.width,
  });

  final CategoryItemInfoEntity categoryItemEntity;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 240.w,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CategoryItemImage(
              categoryItemEntity: categoryItemEntity,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _CategoryItemNameAndDescriptionSection(
                      categoryItemEntity: categoryItemEntity,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RatingsItemWithCount(
                          numOfRatings: categoryItemEntity.totalReviews.toInt(),
                          starsCount: categoryItemEntity.averageRating,
                          size: 19.r,
                        ),
                        // child: SizedBox(),
                      ),
                      FavoriteIcon(
                        itemId: categoryItemEntity.id,
                        isBusiness: true,
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
