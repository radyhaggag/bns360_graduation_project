import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared_data/entities/category_item_entity.dart';
import '../../helpers/localization_helper.dart';

part 'category_details_image.dart';
part 'category_details_rating_section.dart';
part 'category_favorite_button.dart';
part 'category_name_and_description_section.dart';

class CategoryDetailsCard extends StatelessWidget {
  const CategoryDetailsCard({
    super.key,
    required this.categoryDetailsEntity,
    this.onIconPressed,
    this.width,
    this.isFavorite,
    this.useSetStateToChangeFavoriteColor,
  });

  final CategoryItemEntity categoryDetailsEntity;
  final void Function()? onIconPressed;
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
            _CategoryDetailsImage(
              imageUrl: categoryDetailsEntity.imageUrl,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _CategoryDetailsNameAndDescriptionSection(
                      categoryDetailsEntity: categoryDetailsEntity,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _CategoryDetailsRatingSection(
                          numOfRatings: categoryDetailsEntity.numOfRatings,
                          starsCount: categoryDetailsEntity.starsCount,
                        ),
                      ),
                      _CategoryFavoriteButton(
                        onPressed: onIconPressed,
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
