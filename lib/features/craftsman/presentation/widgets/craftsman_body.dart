import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/reviews/main_review_summary_card/main_review_summary_card.dart';
import 'craftsman_description.dart';
import 'craftsman_info/craftsman_info_section.dart';
import 'craftsman_profile_section.dart';
import 'craftsman_slider/craftsman_slider_section.dart';
import 'write_review_btn.dart';

class CraftsmanBody extends StatelessWidget {
  const CraftsmanBody({
    super.key,
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 225.h,
            primary: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CraftsmanSliderSection(
                images: [
                  craftsmanEntity.imageUrl,
                  craftsmanEntity.imageUrl,
                  craftsmanEntity.imageUrl,
                  craftsmanEntity.imageUrl,
                  craftsmanEntity.imageUrl,
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
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  CraftsmanProfileSection(
                    craftsmanEntity: craftsmanEntity,
                  ),
                  const SizedBox(height: 20),
                  CraftsmanDescription(
                    description: LocalizationHelper.getLocalizedString(
                      context,
                      // ar: craftsmanEntity.descriptionAR,
                      // en: craftsmanEntity.descriptionEN,
                      ar: craftsmanEntity.name,
                      en: craftsmanEntity.name,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CraftsmanInfoSection(
                    craftsmanEntity: craftsmanEntity,
                  ),
                  const SizedBox(height: 20),
                  MainReviewSummaryCard(
                    numOfRatings: craftsmanEntity.numOfRatings,
                    starsCount: craftsmanEntity.averageRatings,
                    onViewAllTap: () {
                      Navigator.of(context).pushNamed(
                        Routes.craftsmanReviewSummary,
                        arguments: craftsmanEntity,
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
            sliver: const SliverToBoxAdapter(
              child: WriteReviewBtn(),
            ),
          ),
        ],
      ),
    );
  }
}
