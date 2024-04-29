import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/route_config.dart';
import '../../helpers/localization_helper.dart';
import '../../shared_data/entities/category_item_entity.dart';
import '../icons/favorite_icon.dart';
import '../main_network_image.dart';

part 'category_item_image.dart';
part 'category_item_name_and_description_section.dart';

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({
    super.key,
    required this.categoryItemEntity,
    this.onFavoriteIconPressed,
    this.width,
    this.isFavorite,
    this.useSetStateToChangeFavoriteColor,
  });

  final CategoryItemEntity categoryItemEntity;
  final void Function()? onFavoriteIconPressed;
  final double? width;
  final bool? isFavorite;
  final bool? useSetStateToChangeFavoriteColor;

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
                      const Expanded(
                        // child: RatingsItemWithCount(
                        //   numOfRatings: categoryItemEntity.numOfRatings,
                        //   starsCount: categoryItemEntity.starsCount,
                        //   size: 19.r,
                        // ),
                        child: SizedBox(),
                      ),
                      FavoriteIcon(
                        onPressed: onFavoriteIconPressed,
                        isFavorite: isFavorite,
                        useSetStateToChangeColor:
                            useSetStateToChangeFavoriteColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
