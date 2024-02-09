import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_back_button.dart';
import 'category_item_description.dart';
import 'category_item_info/category_item_info_section.dart';
import 'category_item_profile_section.dart';
import '../../../../core/widgets/main_review_card/main_review_card.dart';
import 'category_item_slider/category_item_slider_section.dart';

class CategoryItemBody extends StatelessWidget {
  const CategoryItemBody({
    super.key,
    required this.categoryItemEntity,
  });

  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 225.h,
            primary: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CategoryItemSliderSection(
                images: [
                  categoryItemEntity.imageUrl,
                  categoryItemEntity.imageUrl,
                  categoryItemEntity.imageUrl,
                  categoryItemEntity.imageUrl,
                  categoryItemEntity.imageUrl,
                ],
              ),
            ),
            leading: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const CustomBackButtonWithCircle(
                color: AppColors.black,
              ),
            ),
            leadingWidth: 50.r,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  CategoryItemProfileSection(
                    categoryItemEntity: categoryItemEntity,
                  ),
                  const SizedBox(height: 20),
                  CategoryItemDescription(
                    description: LocalizationHelper.getLocalizedString(
                      context,
                      ar: categoryItemEntity.descriptionAR,
                      en: categoryItemEntity.descriptionEN,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CategoryItemInfoSection(
                    categoryItemEntity: categoryItemEntity,
                  ),
                  const SizedBox(height: 20),
                  const MainReviewCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
