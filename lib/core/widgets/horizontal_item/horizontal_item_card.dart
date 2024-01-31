import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/media_query.dart';
import '../../../../../core/widgets/category_favorite_button.dart';
import '../../utils/app_fonts.dart';
import '../main_network_image.dart';
import '../ratings_item_with_count.dart';

part 'craftsman_image.dart';
part 'title_and_sub_title_section.dart';

class HorizontalItemCard extends StatelessWidget {
  const HorizontalItemCard({
    super.key,
    required this.title,
    this.onIconPressed,
    this.width,
    this.isFavorite,
    this.useSetStateToChangeFavoriteColor,
    required this.subTitle,
    required this.starsCount,
    required this.numOfRatings,
    required this.imageUrl,
  });

  final String title;
  final String subTitle;
  final String imageUrl;
  final num starsCount;
  final int numOfRatings;
  final double? width;
  final bool? isFavorite;
  final bool? useSetStateToChangeFavoriteColor;
  final void Function()? onIconPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 100.h,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 15),
            _CategoryItemImage(
              imageUrl: imageUrl,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TitleAndSubTitleSection(
                    title: title,
                    subTitle: subTitle,
                  ),
                  RatingsItemWithCount(
                    numOfRatings: numOfRatings,
                    starsCount: starsCount,
                    size: 15.r,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CategoryFavoriteButton(
                  onPressed: onIconPressed,
                  isFavorite: isFavorite,
                  useSetStateToChangeColor: useSetStateToChangeFavoriteColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
