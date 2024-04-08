import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/widgets/buttons/write_review_btn.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/custom_slider/custom_slider.dart';
import '../../../../core/widgets/reviews/main_review_summary_card/main_review_summary_card.dart';
import 'category_item_description.dart';
import 'category_item_info/category_item_info_section.dart';
import 'category_item_profile_section.dart';

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
              background: CustomSlider(
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
              child: CustomBackButtonWithCircle(
                color: context.theme.primaryColor,
              ),
            ),
            leadingWidth: 50.r,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
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
                  MainReviewSummaryCard(
                    numOfRatings: categoryItemEntity.numOfRatings,
                    starsCount: categoryItemEntity.starsCount,
                    mainColor: context.theme.listTileTheme.tileColor,
                    onViewAllTap: () {
                      Navigator.of(context).pushNamed(
                        Routes.categoryItemReviewSummary,
                        arguments: categoryItemEntity,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 50.w,
              vertical: 20,
            ),
            sliver: SliverToBoxAdapter(
              child: WriteReviewBtn(
                addReviewCallback: (rating, value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
